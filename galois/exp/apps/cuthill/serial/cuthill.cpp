#include "Galois/Galois.h"
#include "Galois/Bag.h"
#include "Galois/Accumulator.h"
#include "Galois/Timer.h"
#include "Galois/Statistic.h"
#include "Galois/Graph/LCGraph.h"
#include "Galois/Graph/Graph.h"
#ifdef GALOIS_USE_EXP
#include "Galois/Runtime/ParallelWorkInline.h"
#endif
#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/SmallVector.h"
#include "Lonestar/BoilerPlate.h"

//kik 
#include "Galois/Atomic.h"

#include <string>
#include <sstream>
#include <limits>
#include <iostream>
#include <fstream>
#include <deque>
#include <cmath>
#include <functional>
#include <numeric>

#include <sys/time.h>

#define FINE_GRAIN_TIMING 
//#define GALOIS_JUNE
//#define NO_SORT
//#define FIND_COMPONENTS
//#define PRINT_DEGREE_DISTR

static const char* name = "Serial Cuthill-McKee Reordering";
static const char* desc =
  "Computes a reordering of matrix rows and columns (or a relabeling of graph nodes)"
  "according to the Cuthill-McKee heuristic";
static const char* url = 0;

//****** Command Line Options ******
enum Algo {
	serialCM,
	//barrierCM,
};

enum ExecPhase {
	INIT,
	SELECT,
	RUN,
	TOTAL,
};

static const unsigned int DIST_INFINITY =
  std::numeric_limits<unsigned int>::max() - 1;

namespace cll = llvm::cl;
static cll::opt<unsigned int> startNode("startnode",
    cll::desc("Node to start search from"),
    cll::init(DIST_INFINITY));
static cll::opt<unsigned int> reportNode("reportnode",
    cll::desc("Node to report distance to"),
    cll::init(1));
static cll::opt<bool> scaling("scaling", 
		llvm::cl::desc("Scale to the number of threads with a given step starting from"), 
		llvm::cl::init(false));
static cll::opt<unsigned int> scalingStep("step",
    cll::desc("Scaling step"),
    cll::init(2));
static cll::opt<unsigned int> niter("iter",
    cll::desc("Number of benchmarking iterations"),
    cll::init(1));
static cll::opt<Algo> algo(cll::desc("Choose an algorithm:"),
    cll::values(
      clEnumVal(serialCM, "Serial Cuthill-McKee"),
      //clEnumVal(barrierCM, "Barrier-based Parallel Cuthill-McKee"),
      clEnumValEnd), cll::init(serialCM));
static cll::opt<std::string> filename(cll::Positional,
    cll::desc("<input file>"),
    cll::Required);
static cll::opt<std::string> permfile(cll::Positional,
    cll::desc("<permutation output file>"),
		cll::init(filename + ".ord"));
static cll::opt<std::string> otherfile(cll::Positional,
    cll::desc("<3rd party permutation input file>"),
		cll::Optional);

//****** Work Item and Node Data Defintions ******
struct SNode {
	unsigned int id;
  unsigned int degree;
  unsigned int dist;
};

struct Prefix {
  unsigned int id;
	unsigned int val;
	Prefix(unsigned int _id, unsigned _val) : id(_id), val(_val) {}
};

//typedef Galois::Graph::LC_Linear_Graph<SNode, void> Graph;
typedef Galois::Graph::LC_CSR_Graph<SNode, void> Graph;
//typedef Galois::Graph::LC_CSRInline_Graph<SNode, char> Graph;
//typedef Galois::Graph::FirstGraph<SNode, void, false> Graph;
typedef Graph::GraphNode GNode;

Graph graph;

static size_t degree(const GNode& node) { 
    return std::distance(graph.edge_begin(node, Galois::MethodFlag::NONE), graph.edge_end(node, Galois::MethodFlag::NONE));
}

std::ostream& operator<<(std::ostream& out, const SNode& n) {
  out <<  "(dist: " << n.dist << ")";
  return out;
}

struct GNodeIndexer {
  unsigned int operator()(const GNode& val) const {
    return graph.getData(val, Galois::MethodFlag::NONE).dist;
  }
};

struct GNodeLess {
  bool operator()(const GNode& a, const GNode& b) const {
    return graph.getData(a, Galois::MethodFlag::NONE).dist < graph.getData(b, Galois::MethodFlag::NONE).dist;
  }
};

struct GNodeGreater {
  bool operator()(const GNode& a, const GNode& b) const {
    return graph.getData(a, Galois::MethodFlag::NONE).dist > graph.getData(b, Galois::MethodFlag::NONE).dist;
  }
};

struct GNodeBefore {
  bool operator()(const GNode& a, const GNode& b) const {
    return (degree(a) < degree(b));
  }
};

std::vector<GNode> perm;
std::vector<unsigned int> levelptr;
std::vector<GNode> otherperm;

void printCM(std::vector<GNode>& ordering){
	std::cerr << "Cuthill-McKee Permutation:\n";
	for(std::vector<GNode>::iterator nit = ordering.begin(); nit != ordering.end(); nit++){
		SNode& data = graph.getData(*nit, Galois::MethodFlag::NONE);
		std::cerr << data.id + 1 << "\n";
	}
	std::cerr << "\n";
}

void printRCM(std::vector<GNode>& ordering){
	std::cerr << "Reverse Cuthill-McKee Permutation:\n";
	for(std::vector<GNode>::reverse_iterator nit = ordering.rbegin(); nit != ordering.rend(); nit++){
		SNode& data = graph.getData(*nit, Galois::MethodFlag::NONE);
		std::cerr << data.id+1 << "\n";
	}
	std::cerr << "\n";
}

void saveRCM() {
	std::ofstream outfile(permfile.c_str());
	outfile << "%%MatrixMarket matrix array integer general" << std::endl;
	outfile << perm.size() << " 1" << std::endl;

	for(std::vector<GNode>::reverse_iterator nit = perm.rbegin(); nit != perm.rend(); nit++){
		outfile << graph.getData(*nit, Galois::MethodFlag::NONE).id << "\n";
	}
	outfile.close();
}

void loadPerm() {
	std::ifstream infile(otherfile.c_str());

	while (infile) {
		if (infile.peek() != '%')
			break;
		infile.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
	}

	unsigned nnodes, dim;
	infile >> nnodes >> dim;

	if(nnodes != graph.size() || dim != 1){
		std::cerr << "Error: permutation array dimensions (" << nnodes << ", " << dim << ") are incorrect\n";
		exit(1);
	}

	otherperm.reserve(nnodes);
	otherperm.resize(nnodes);
	for (unsigned i = 0; i < nnodes; ++i) {
		int idx;
		infile >> idx;
		if (!infile) {
			std::cerr << "Error: expected " << nnodes << " entries but found " << i << "\n";
			exit(1);
		}
		otherperm[i] = idx-1;
	}
}

static void permute(std::vector<GNode>& ordering) {

	std::vector<GNode> nodemap;
	nodemap.reserve(graph.size());;

	for (Graph::iterator src = graph.begin(), ei =
			graph.end(); src != ei; ++src) {

		nodemap[graph.getData(*src, Galois::MethodFlag::NONE).id] = *src;
	}

	unsigned int N = ordering.size() - 1;

	for(int i = N; i >= 0; --i) {
		//std::cerr << ordering[i] << " " << graph.getData(nodemap[ordering[i]]).id << " changes to: " << N - i << "\n";
		// RCM
		graph.getData(ordering[i], Galois::MethodFlag::NONE).id = N - i;
		// CM
		//graph.getData(ordering[i], Galois::MethodFlag::NONE).id = i;
	}
}

// Find a good starting node for CM based on minimum degree
static void findStartingNode(GNode& starting) {
	unsigned int mindegree = DIST_INFINITY; 

	for (Graph::iterator src = graph.begin(), ei =
			graph.end(); src != ei; ++src) {
		unsigned int nodedegree = degree(*src);

		/*
		if(nodedegree == mindegree){
			SNode& data = graph.getData(*src, Galois::MethodFlag::NONE);
			std::cerr << "Candidate Node: " << data.id << " degree: " << degree(*src) << "\n";
		}
		*/

		if(nodedegree < mindegree){
			mindegree = nodedegree;
			starting = *src;
		}
	}

	SNode& data = graph.getData(starting, Galois::MethodFlag::NONE);
	std::cerr << "Initial node: " << data.id << " with degree (minimum): " << degree(starting) << "\n";
}

template<typename T>
class GReduceAverage {
  typedef std::pair<T, unsigned> TP;
  struct AVG {
    void operator() (TP& lhs, const TP& rhs) const {
      lhs.first += rhs.first;
      lhs.second += rhs.second;
    }
  };
  Galois::GReducible<std::pair<T, unsigned>, AVG> data;

public:
  void update(const T& _newVal) {
    data.update(std::make_pair(_newVal, 1));
  }

  /**
   * returns the thread local value if in a parallel loop or
   * the final reduction if in serial mode
   */
  const T reduce() {
#ifdef GALOIS_JUNE
    const TP& d = data.get();
#else
    const TP& d = data.reduce();
#endif
    return d.first / d.second;
  }

  void reset(const T& d) {
    data.reset(std::make_pair(d, 0));
  }

  GReduceAverage& insert(const T& rhs) {
#ifdef GALOIS_JUNE
    TP& d = data.get();
#else
    TP& d = data.reduce();
#endif
    d.first += rhs;
    d.second++;
    return *this;
  }
};

//Compute mean distance from the source
struct avg_dist {
  GReduceAverage<unsigned long int>& m;
  avg_dist(GReduceAverage<unsigned long int>& _m): m(_m) { }

  void operator()(const GNode& n) const {
		if(graph.getData(n).dist < DIST_INFINITY)
			m.update(graph.getData(n).dist);
  }
};

//Compute variance around mean distance from the source
static void variance(unsigned long int mean) {
	unsigned long int n = 0;
	long double M2 = 0.0;
	long double var = 0.0;

	for (Graph::iterator src = graph.begin(), ei = graph.end(); src != ei; ++src) {
		SNode& data = graph.getData(*src);
		if(data.dist < DIST_INFINITY){
			M2 += (data.dist - mean)*(data.dist - mean);
			++n;
		}
	}

	var = M2/(n-1);
	std::cout << "var: " << var << " mean: " << mean << "\n";
}

struct not_consistent {
  bool operator()(GNode n) const {
    unsigned int dist = graph.getData(n).dist;
    for (Graph::edge_iterator ii = graph.edge_begin(n), ei = graph.edge_end(n); ii != ei; ++ii) {
      GNode dst = graph.getEdgeDst(ii);
      unsigned int ddist = graph.getData(dst).dist;
      if (ddist > dist + 1) {
        std::cerr << "bad level value for " << graph.getData(dst).id << ": " << ddist << " > " << (dist + 1) << "\n";
	return true;
      }
    }
    return false;
  }
};

struct not_visited {
  bool operator()(GNode n) const {
    unsigned int dist = graph.getData(n).dist;
    if (dist >= DIST_INFINITY) {
#ifndef FIND_COMPONENTS
      std::cerr << "unvisited node " << graph.getData(n).id << ": " << dist << " >= INFINITY\n";
#endif
      return true;
    }
		//std::cerr << "visited node " << graph.getData(n).id << ": " << dist << "\n";
    return false;
  }
};

struct max_dist {
  Galois::GReduceMax<unsigned long int>& m;
  max_dist(Galois::GReduceMax<unsigned long int>& _m): m(_m) { }

  void operator()(const GNode& n) const {
		if(graph.getData(n).dist < DIST_INFINITY)
			m.update(graph.getData(n).dist);
  }
};

struct is_touched {
  bool operator()(const GNode& n) const {
    return graph.getData(n).dist < DIST_INFINITY;
  }
};

unsigned int count_touched() {
#ifdef GALOIS_JUNE
    return Galois::count_if(graph.begin(), graph.end(), is_touched());
#else
    return Galois::ParallelSTL::count_if(graph.begin(), graph.end(), is_touched());
#endif
}

bool pick_source(Graph::iterator& start) {
#ifdef GALOIS_JUNE
  Graph::iterator iter = Galois::find_if(start, graph.end(), not_visited());
#else
  Graph::iterator iter = Galois::ParallelSTL::find_if(start, graph.end(), not_visited());
#endif

	if(iter != graph.end()){
		start = iter;
		return true;
	}

	return false;
}

//! Simple verifier
static bool verify(GNode& source) {
  if (graph.getData(source).dist != 0) {
    std::cerr << "source has non-zero dist value\n";
    return false;
  }
  
  //size_t id = 0;
  
#ifdef GALOIS_JUNE
  bool okay = Galois::find_if(graph.begin(), graph.end(), not_consistent()) == graph.end()
    && Galois::find_if(graph.begin(), graph.end(), not_visited()) == graph.end();
#else
  bool okay = Galois::ParallelSTL::find_if(graph.begin(), graph.end(), not_consistent()) == graph.end()
    && Galois::ParallelSTL::find_if(graph.begin(), graph.end(), not_visited()) == graph.end();
#endif

  //if (okay) {
    Galois::GReduceMax<unsigned long int> m;
    GReduceAverage<unsigned long int> mean;
    Galois::do_all(graph.begin(), graph.end(), max_dist(m));
#ifdef GALOIS_JUNE
    std::cout << "max dist: " << m.get() << "\n";
#else
    std::cout << "max dist: " << m.reduce() << "\n";
#endif
    Galois::do_all(graph.begin(), graph.end(), avg_dist(mean));
    Galois::do_all(graph.begin(), graph.end(), avg_dist(mean));
    std::cout << "avg dist: " << mean.reduce() << "\n";

		variance(mean.reduce());
  //}
  
  return okay;
}

// Compute maximum bandwidth for a given graph
struct banddiff {

	Galois::GAtomic<long int>& maxband;
	Galois::GAtomic<long int>& profile;
	std::vector<GNode>& nmap; 
	//std::vector<std::set<unsigned int> >& wf;

	//banddiff(Galois::GAtomic<long int>& _mb, Galois::GAtomic<long int>& _pr, std::vector<GNode>& _nm, std::vector<std::set<unsigned int> >& _wf) : maxband(_mb), profile(_pr), nmap(_nm), wf(_wf){ }
	banddiff(Galois::GAtomic<long int>& _mb, Galois::GAtomic<long int>& _pr, std::vector<GNode>& _nm) : maxband(_mb), profile(_pr), nmap(_nm) { }

	void operator()(const GNode& source) const {

		long int maxdiff = 0;
		SNode& sdata = graph.getData(source, Galois::MethodFlag::NONE);

/*
		wf[sdata.id].insert(sdata.id);

		std::cerr << "WF[" << sdata.id << "]:\n";
		
		for(int prev = 0; prev <= sdata.id; ++prev){
			for (Graph::edge_iterator iw = graph.edge_begin(nmap[prev], Galois::MethodFlag::NONE), 
					ew = graph.edge_end(nmap[prev], Galois::MethodFlag::NONE); iw != ew; ++iw) {
				GNode wavenode = graph.getEdgeDst(iw);
				SNode& wdata = graph.getData(wavenode, Galois::MethodFlag::NONE);
				//std::cerr << " " << wdata.id;
				if(sdata.id < wdata.id)
					wf[sdata.id].insert(wdata.id);
			}
		}

		//std::cerr << wf[sdata.id].size() << "\n";
		*/

		for (Graph::edge_iterator ii = graph.edge_begin(source, Galois::MethodFlag::NONE), 
				ei = graph.edge_end(source, Galois::MethodFlag::NONE); ii != ei; ++ii) {

			GNode dst = graph.getEdgeDst(ii);
			SNode& ddata = graph.getData(dst, Galois::MethodFlag::NONE);

			long int diff = abs(sdata.id - ddata.id);
			//long int diff = (long int) sdata.id - (long int) ddata.id;
			maxdiff = diff > maxdiff ? diff : maxdiff;
		}

		long int globalmax = maxband;
		profile += maxdiff;

		if(maxdiff > globalmax){
			while(!maxband.cas(globalmax, maxdiff)){
				globalmax = maxband;
				if(!maxdiff > globalmax)
					break;
			}
		}
	}
};

// Parallel loop for maximum bandwidth computation
/*
 * Approach following strict the combinatorial description. Computation cost unacceptable.
 * I leave here for backup. Will delete in later revision. 
 */
/*
static void bandwidth(std::string msg) {
		Galois::GAtomic<long int> bandwidth = Galois::GAtomic<long int>(0);
		Galois::GAtomic<long int> profile = Galois::GAtomic<long int>(0);
		typedef std::set<unsigned int> Wavefront;
		std::vector<Wavefront> wf;
		std::vector<GNode> nodemap;
		//wf[id] = std::set<unsigned int>();
		//wf[id] = Wavefront();
		wf.reserve(graph.size());;
		wf.resize(graph.size(), Wavefront());;
		nodemap.reserve(graph.size());;

		static int count = 0;
    std::cout << graph.size() << "Run: " << count++ << "\n";

		for (Graph::iterator src = graph.begin(), ei =
				graph.end(); src != ei; ++src) {
			nodemap[graph.getData(*src, Galois::MethodFlag::NONE).id] = *src;
		}

    //Galois::do_all(graph.begin(), graph.end(), banddiff(bandwidth, profile, nodemap, wf));
    Galois::do_all(graph.begin(), graph.end(), banddiff(bandwidth, profile, nodemap));

		//wf[0] = Wavefront();
		wf[0].insert(0);

		for (Graph::edge_iterator ii = graph.edge_begin(nodemap[0], Galois::MethodFlag::NONE), 
				ei = graph.edge_end(nodemap[0], Galois::MethodFlag::NONE); ii != ei; ++ii) {
			GNode neigh = graph.getEdgeDst(ii);
			SNode& ndata = graph.getData(neigh, Galois::MethodFlag::NONE);
			wf[0].insert(ndata.id);
		}

		unsigned int maxwf = wf[0].size();
		double mswf = (double) maxwf * maxwf;

		for(unsigned int i = 1; i < graph.size(); ++i){
			//wf[i] = Wavefront();
			wf[i].insert(i);

			std::cerr << "Neigh: " << i << "\n";

			for (Graph::edge_iterator ii = graph.edge_begin(nodemap[i], Galois::MethodFlag::NONE), 
					ei = graph.edge_end(nodemap[i], Galois::MethodFlag::NONE); ii != ei; ++ii) {

				GNode neigh = graph.getEdgeDst(ii);
				SNode& ndata = graph.getData(neigh, Galois::MethodFlag::NONE);
				//std::cerr << " " << wdata.id;
				if(ndata.id > i)
					wf[i].insert(ndata.id);
			}

			//std::merge(tmpset.begin(), tmpset.end(), wf[i-1].begin(), wf[i-1].end(), wf[i].begin());
			wf[i].insert(wf[i-1].begin(), wf[i-1].end());
			wf[i].erase(i-1);

			unsigned int curwf = wf[i].size();
			maxwf = curwf > maxwf ? curwf : maxwf;
			mswf += (double) curwf * curwf;
		}
		mswf = mswf / graph.size();

    std::cout << msg << " Bandwidth: " << bandwidth << "\n";
    std::cout << msg << " Profile: " << profile << "\n";
    std::cout << msg << " Maximum Wavefront: " << maxwf << "\n";
    std::cout << msg << " Mean-Square Wavefront: " << mswf << "\n";
    std::cout << msg << " Root-Mean-Square Wavefront: " << sqrt(mswf) << "\n";

		//wf.clear();
		//nodemap.clear();
}
*/

// Parallel loop for maximum bandwidth computation
static void bandwidth(std::string msg) {
		Galois::GAtomic<long int> bandwidth = Galois::GAtomic<long int>(0);
		Galois::GAtomic<long int> profile = Galois::GAtomic<long int>(0);
		std::vector<GNode> nodemap;
		std::vector<bool> visited;
		visited.reserve(graph.size());;
		visited.resize(graph.size(), false);;
		nodemap.reserve(graph.size());;

		//static int count = 0;
    //std::cout << graph.size() << "Run: " << count++ << "\n";

		for (Graph::iterator src = graph.begin(), ei =
				graph.end(); src != ei; ++src) {
			nodemap[graph.getData(*src, Galois::MethodFlag::NONE).id] = *src;
		}

		//Computation of bandwidth and profile in parallel
    Galois::do_all(graph.begin(), graph.end(), banddiff(bandwidth, profile, nodemap));

		unsigned int nactiv = 0;
		unsigned int maxwf = 0;
		unsigned int curwf = 0;
		double mswf = 0.0;

		//Computation of maximum and root-square-mean wavefront. Serial
		for(unsigned int i = 0; i < graph.size(); ++i){

			for (Graph::edge_iterator ii = graph.edge_begin(nodemap[i], Galois::MethodFlag::NONE), 
					ei = graph.edge_end(nodemap[i], Galois::MethodFlag::NONE); ii != ei; ++ii) {

				GNode neigh = graph.getEdgeDst(ii);
				SNode& ndata = graph.getData(neigh, Galois::MethodFlag::NONE);

				//std::cerr << "neigh: " << ndata.id << "\n";
				if(visited[ndata.id] == false){
					visited[ndata.id] = true;
					nactiv++;
				//	std::cerr << "val: " << nactiv<< "\n";
				}
			}

			SNode& idata = graph.getData(nodemap[i], Galois::MethodFlag::NONE);

			if(visited[idata.id] == false){
				visited[idata.id] = true;
				curwf = nactiv+1;
			}
			else
				curwf = nactiv--;

			maxwf = curwf > maxwf ? curwf : maxwf;
			mswf += (double) curwf * curwf;
		}

		mswf = mswf / graph.size();

    std::cout << msg << " Bandwidth: " << bandwidth << "\n";
    std::cout << msg << " Profile: " << profile << "\n";
    std::cout << msg << " Max WF: " << maxwf << "\n";
    std::cout << msg << " Mean-Square WF: " << mswf << "\n";
    std::cout << msg << " RMS WF: " << sqrt(mswf) << "\n";

		//nodemap.clear();
}

//Clear node data to re-execute on specific graph
struct resetNode {
	void operator()(const GNode& n) const {
		SNode& data = graph.getData(n, Galois::MethodFlag::NONE);
		data.degree = degree(n);
		data.dist = DIST_INFINITY;
		//graph.getData(n, Galois::MethodFlag::NONE).dist = DIST_INFINITY;
	}
};

static void resetGraph() {
	Galois::do_all(graph.begin(), graph.end(), resetNode());
	//perm.clear();
}

void printDegreeDistribution() {
	std::map<unsigned int, unsigned int> distr;

	for (Graph::iterator n = graph.begin(), ei = graph.end(); n != ei; ++n) {
			distr[degree(*n)]++;
	}

	std::cerr << "Degree	Count\n";
	for (std::map<unsigned int, unsigned int>::iterator slot = distr.begin(), ei = distr.end(); slot != ei; ++slot) {
		std::cerr << slot->first << "	" << slot->second << "\n";
	}
}

// Read graph from a binary .gr as dirived from a Matrix Market .mtx using graph-convert
static void readGraph(GNode& source, GNode& report) {
  Galois::Graph::readGraph(graph, filename);

  source = *graph.begin();
  report = *graph.begin();

  size_t nnodes = graph.size();
  std::cout << "Read " << nnodes << " nodes\n";
  
  size_t id = 0;
  bool foundReport = false;
  bool foundSource = false;

	perm.reserve(nnodes);

  for (Graph::iterator src = graph.begin(), ei =
      graph.end(); src != ei; ++src) {

    SNode& node = graph.getData(*src, Galois::MethodFlag::NONE);
    node.id = id;
    node.degree = degree(*src);
    node.dist = DIST_INFINITY;

    if (id == startNode) {
      source = *src;
      foundSource = true;
    } 
    if (id == reportNode) {
      foundReport = true;
      report = *src;
    }
    ++id;
  }

	if(startNode == DIST_INFINITY){
		findStartingNode(source);
		foundSource = true;
	}

  if (!foundReport || !foundSource) {
    std::cerr 
      << "failed to set report: " << reportNode 
      << " or failed to set source: " << startNode << "\n";
    assert(0);
    abort();
  }
}

//! Serial Cuthill-McKee using Galois graph
struct SerialBFS {

	struct BfsFn { 
		unsigned int height;
		unsigned int width;
		unsigned int maxwidth;

		std::vector<GNode> order;
		std::vector<unsigned int> levelptr;

		// The graph structure remains the same, but each time a BFS is created, we need to reset distances and degrees
		// The real degree is always given by the function
		// The Snode structure member "degree" maybe inconsistet due to the strategy. 
		// After a BFS is created is restored to the real value with a reset
		BfsFn() : height(0), width(0), maxwidth(DIST_INFINITY) { order.reserve(graph.size()); resetGraph();}
		BfsFn(unsigned int max) : height(0), width(0), maxwidth(max) { order.reserve(graph.size()); resetGraph();}

		std::string name() const { return "Serial BFS"; }

		// If return > 0 BFS run has been interrupted due to high width.
		unsigned int operator()(const GNode& source) {

			SNode& sdata = graph.getData(source, Galois::MethodFlag::NONE);
			sdata.dist = 0;

			order.push_back(source);
			levelptr.push_back(0);
			// levelptr.push_back(1);

			unsigned int index = 0;
			unsigned int curdist = 0;

			while (index < order.size()) {

				GNode parent = order[index];
				SNode& data = graph.getData(parent, Galois::MethodFlag::NONE);

				if(data.dist > curdist){
					levelptr.push_back(index);
					curdist = data.dist;
					unsigned int last = levelptr.size() - 1;
					unsigned int curwidth = levelptr[last] - levelptr[last-1]; 
					if(curwidth > maxwidth)
						return curwidth;
					if(curwidth > width)
						width = curwidth;
				}

				for (Graph::edge_iterator ii = graph.edge_begin(parent, Galois::MethodFlag::NONE), ei = graph.edge_end(parent, Galois::MethodFlag::NONE); ii != ei; ++ii) {

					GNode child = graph.getEdgeDst(ii);
					SNode& cdata = graph.getData(child, Galois::MethodFlag::NONE);

					unsigned int newDist = curdist + 1;

					if (newDist < cdata.dist){
						order.push_back(child);
						cdata.dist = newDist;
					}
				}
				++index;
			}
			levelptr.push_back(index);
			height = curdist;
                        return 0;
		}

		unsigned int getHeight(){ return height; }

		unsigned int getWidth(unsigned int level){ return levelptr[level+1] - levelptr[level]; }

		unsigned int getMaxWidth(){ return width; }

		void levelset(std::vector<GNode>& set, unsigned int level){ 
			//set.resize(levelptr[level+1] - levelptr[level]);
			//std::cerr << "Copying level nodes from: " << levelptr[level] << " to " << levelptr[level+1] << "\n";
			std::copy(order.begin()+levelptr[level], order.begin()+levelptr[level+1], set.begin()); 
		}
	};

	//template <typename SHR>
	struct PseudoDiameter {
		std::string name() const { return "Serial PseudoDiameter"; }

		void operator()(GNode& snode, GNode& enode) {

			bool foundEndNode = false;
			unsigned int fwidth; 
			unsigned int rwidth;

			do { 
				BfsFn forward;
				//std::cerr << "Forward with: " << graph.getData(snode).id << ": " << degree(snode) << "\n";
				forward(snode);

				std::vector<GNode> lastset;
				std::vector<GNode> chosen;
				lastset.resize(forward.getWidth(forward.getHeight()));
				forward.levelset(lastset, forward.getHeight());

				FirstFive strategy;
				//IN: lastset OUT: chosen, the candidate set
				strategy(chosen, lastset);

				fwidth = forward.getMaxWidth();

				rwidth = DIST_INFINITY;

				std::cout << "snode: " << fwidth << " " << graph.getData(snode, Galois::MethodFlag::NONE).id 
					<< " " << chosen.size() << " " << lastset.size() << " "
					<< forward.getHeight() 
					<< "\n";
				//std::cerr << "height: " << forward.getHeight() << " width[last]: " << forward.getWidth(forward.getHeight()) << " maxwidth: " << forward.getMaxWidth() << "\n";
				//std::cerr << "lastset size: " << lastset.size() << "\n";

				for(unsigned i = 0; i < chosen.size(); ++i) {
					std::cout << "rnode: "
						<< graph.getData(chosen[i], Galois::MethodFlag::NONE).id << " "
						<< graph.getData(chosen[i], Galois::MethodFlag::NONE).dist << "\n";
					//BfsFn reverse(forward.getMaxWidth());
					BfsFn reverse(rwidth);

					//std::cerr << "Candidate: " << graph.getData(chosen[i]).id << ": " << degree(chosen[i]) << "\n";

					unsigned int res = reverse(chosen[i]);
					//std::cerr << "Reverse with: " << graph.getData(chosen[i]).id << " and res: " << res << "\n";
					//std::cerr << "height: " << reverse.getHeight() << " width[last]: " << reverse.getWidth(reverse.getHeight()) << " maxwidth: " << reverse.getMaxWidth() << "\n";
					//std::cerr << "Fwidth: " << fwidth << " and rwidth: " << rwidth << "\n";

					if(res)
						continue;

					std::cout << "rnode: "
						<< reverse.getHeight() << " "
						<< forward.getHeight() << " "
						<< reverse.getMaxWidth() << " "
						<< rwidth << "\n";

					if(reverse.getHeight() > forward.getHeight() && reverse.getMaxWidth() < rwidth){
						//std::cerr << "2nd case height: " << reverse.getHeight() << " >? " << forward.getHeight() << " width: " << reverse.getMaxWidth() << " <? " << rwidth << "\n";
						snode = chosen[i];
						break;
					}
					else if(reverse.getMaxWidth() < rwidth) { 
						rwidth = reverse.getMaxWidth();
						enode = chosen[i];
						foundEndNode = true;
					}
				}
			} while (foundEndNode == false);

			std::cout << "Selected starting node: " << fwidth << " " 
				<< graph.getData(snode, Galois::MethodFlag::NONE).id << " and end node: "
				<< rwidth << " " << graph.getData(enode, Galois::MethodFlag::NONE).id << "\n";
			if(fwidth > rwidth)
				std::swap(snode, enode);
		}

		// One of the potential strategies to select candidate node from the last level of the bfs level structure
		struct FirstFive {
			void operator()(std::vector<GNode>& chosen, std::vector<GNode>& level){
				for(int i = 0; i < 5; ++i){
					unsigned int mindeg = DIST_INFINITY;

					GNode next; 
					for(std::vector<GNode>::iterator ii=level.begin(), ei=level.end(); ii != ei; ++ii){
						if(graph.getData(*ii, Galois::MethodFlag::NONE).degree < mindeg) {
							mindeg = graph.getData(*ii, Galois::MethodFlag::NONE).degree;
							next = *ii;
						}
					}

					if(mindeg == DIST_INFINITY)
						break; 

					chosen.push_back(next);
					graph.getData(next, Galois::MethodFlag::NONE).degree = DIST_INFINITY;
					//std::cerr << "Chosen: " << graph.getData(next).id << ": " << degree(next) << "\n";

					for (Graph::edge_iterator ii = graph.edge_begin(next, Galois::MethodFlag::NONE), ei = graph.edge_end(next, Galois::MethodFlag::NONE); ii != ei; ++ii) {
						GNode neigh = graph.getEdgeDst(ii);
						graph.getData(neigh, Galois::MethodFlag::NONE).degree = DIST_INFINITY;
					}
				}
			}
		};
	};
};

//! Serial Cuthill-McKee using Galois graph
struct SerialCM {
  std::string name() const { return "Serial Cuthill-McKee"; }

	void operator()(const GNode& source) const {
		Galois::Statistic counter("Iterations");

		SNode& sdata = graph.getData(source, Galois::MethodFlag::NONE);
		sdata.dist = 0;

		perm.push_back(source);

		unsigned int index = 0;
		//unsigned int count = 0;

		while (index < perm.size()) {
			counter += 1;

			GNode parent = perm[index];
			SNode& data = graph.getData(parent, Galois::MethodFlag::NONE);

			//std::cerr << "\n\nWill process node: " << data << " with degree: " << req.n.degree() << " and dist " << data.dist << "\n";

			unsigned int chstart = perm.size();
			unsigned int added = 0;
			unsigned int chend;
			for (Graph::edge_iterator ii = graph.edge_begin(parent, Galois::MethodFlag::NONE), ei = graph.edge_end(parent, Galois::MethodFlag::NONE); ii != ei; ++ii) {

				GNode child = graph.getEdgeDst(ii);
				SNode& cdata = graph.getData(child, Galois::MethodFlag::NONE);
				
				unsigned int newDist = data.dist + 1;

				if (newDist < cdata.dist){
					perm.push_back(child);
					cdata.dist = newDist;
					++added;
				}
			}

			#ifndef NO_SORT
			if(added > 1){
				chend = chstart + added;
				sort(perm.begin()+chstart, perm.begin()+chend, SerialCM());
			}
			#endif

			++index;
		}
	}

	bool operator()(const GNode& u, const GNode& v) const { return degree(u) < degree(v); }
};

template<typename AlgoTy>
void run(const AlgoTy& algo) {
	GNode source, last, report;

	int maxThreads = numThreads; 
	std::vector<Galois::TimeAccumulator> vT(maxThreads+20); 

	//Measure time to read graph
	vT[INIT] = Galois::TimeAccumulator();
	vT[INIT].start();

	Galois::StatTimer itimer("Init", "");
	itimer.start();
	readGraph(source, report);
	itimer.stop();

	vT[INIT].stop();
	std::cout << "Init: " << vT[INIT].get() << " ( " << (double) vT[INIT].get() / 1000 << " seconds )\n";

	vT[SELECT] = Galois::TimeAccumulator();
	vT[SELECT].start();

	last = source;
	if(startNode == DIST_INFINITY){
		SerialBFS::PseudoDiameter selectNodes;
		selectNodes(source, last);
	}

	std::cout << "Running " << algo.name() << " version with " << numThreads << " threads for " << niter << " iterations\n";
	std::cout << "Selected starting node:" << graph.getData(source, Galois::MethodFlag::NONE).id << " and end node: " << graph.getData(last, Galois::MethodFlag::NONE).id << "\n";

	vT[SELECT].stop();
	//Measure total computation time
	vT[TOTAL] = Galois::TimeAccumulator();
	vT[TOTAL].start();

	// Execution with the specified number of threads
	vT[RUN] = Galois::TimeAccumulator();

	// I've observed cold start. First run takes a few millis more. 
	//algo(source);
	// I need this reset after pseudo-diameter computation
	resetGraph();

	bandwidth("Initial");

	Galois::StatTimer T("CuthillTime", "");
	for(unsigned i = 0; i < niter; i++){
		vT[RUN].start();

		T.start();
		algo(source);
		T.stop();

		vT[RUN].stop();

		if(i == niter-1){
			//printRCM(perm);
			saveRCM();
			if(otherfile.length() > 0){
				loadPerm();
				permute(otherperm);
				bandwidth("Permuted with 3rd party ordering");
			}
			permute(perm);
			bandwidth("Permuted");
		}

		std::cout << "Iteration " << i << " numthreads: " << numThreads << " " << vT[RUN].get() << "\n";

		if(i != niter-1){
			resetGraph();
			perm.clear();
		}

#ifdef FIND_COMPONENTS
		resetGraph();
		perm.clear();

		unsigned int icomp = 0;
		unsigned int maxcomp = 0;
		unsigned int cursize = 0;
		unsigned int temp = 0;
		unsigned int diff = 0;

		Graph::iterator start = graph.begin();

		do {
			vT[RUN].start();

			algo(*start);

			vT[RUN].stop();

			temp = count_touched();
			diff = temp - cursize;

			if(diff > maxcomp)
				maxcomp = diff;

			icomp++;
			//if(++icomp % 100 == 0) 
			//	std::cout << "Connected components " << icomp << " with size " << diff << " (max: " << maxcomp << ")\n";

			//if(diff > 10) {
			std::cout << "Connected components " << icomp << " with size " << temp - cursize << " (max: " << maxcomp << ")\n";
			std::cout << "Total time numthreads: " << numThreads << " " << vT[RUN].get() << "\n";
			std::cout << "Avg time per component numthreads: " << numThreads << " " << vT[RUN].get() / icomp << "\n";
			//}
			cursize = temp;

			perm.clear();
		}
		while(pick_source(start));

#endif

		std::cout << "Final time numthreads: " << numThreads << " " << vT[RUN].get() << "\n";
		std::cout << "Avg time numthreads: " << numThreads << " " << vT[RUN].get() / niter << "\n";
	}

#ifdef PRINT_DEGREE_DISTR
	printDegreeDistribution();
#endif

	vT[TOTAL].stop();

	std::cout << "Total with threads: " << numThreads << " " << vT[TOTAL].get() << " ( " << (double) vT[TOTAL].get() / 1000 << " seconds )\n";
	std::cout << "Report node: " << reportNode << " " << graph.getData(report, Galois::MethodFlag::NONE) << "\n";

	if (!skipVerify) {
		if (verify(source)) {
			std::cout << "Verification successful.\n";
		} else {
			std::cerr << "Verification failed.\n";
			assert(0 && "Verification failed");
			abort();
		}
	}
}

int main(int argc, char **argv) {
  Galois::StatManager statManager;
  LonestarStart(argc, argv, name, desc, url);

  using namespace Galois::WorkList;
  typedef BulkSynchronous<dChunkedLIFO<256> > BSWL;

#ifdef GALOIS_USE_EXP
  typedef BulkSynchronousInline<> BSInline;
#else
  typedef BSWL BSInline;
#endif

  switch (algo) {
		case serialCM: run(SerialCM()); break;
		//case barrierCM: run(BarrierRegular()); break;
    default: std::cerr << "Unknown algorithm" << algo << "\n"; abort();
  }

  return 0;
}
