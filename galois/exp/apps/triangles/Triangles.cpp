/** Count triangles -*- C++ -*-
 * @file
 *
 * Count the number of triangles in a graph.
 *
 * @section License
 *
 * Galois, a framework to exploit amorphous data-parallelism in irregular
 * programs.
 *
 * Copyright (C) 2013, The University of Texas at Austin. All rights reserved.
 * UNIVERSITY EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES CONCERNING THIS
 * SOFTWARE AND DOCUMENTATION, INCLUDING ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR ANY PARTICULAR PURPOSE, NON-INFRINGEMENT AND WARRANTIES OF
 * PERFORMANCE, AND ANY WARRANTY THAT MIGHT OTHERWISE ARISE FROM COURSE OF
 * DEALING OR USAGE OF TRADE.  NO WARRANTY IS EITHER EXPRESS OR IMPLIED WITH
 * RESPECT TO THE USE OF THE SOFTWARE OR DOCUMENTATION. Under no circumstances
 * shall University be liable for incidental, special, indirect, direct or
 * consequential damages or loss of profits, interruption of business, or
 * related expenses which may arise from use of Software or Documentation,
 * including but not limited to those resulting from defects in Software and/or
 * Documentation, or loss or inaccuracy of data of any kind.
 *
 * @author Donald Nguyen <ddn@cs.utexas.edu>
 */
#include "Galois/Galois.h"
#include "Galois/Accumulator.h"
#include "Galois/Bag.h"
#include "Galois/Statistic.h"
#include "Galois/Graph/LCGraph.h"
#include "Galois/ParallelSTL/ParallelSTL.h"
#include "llvm/Support/CommandLine.h"
#include "Lonestar/BoilerPlate.h"

#include <boost/iterator/transform_iterator.hpp>
#ifdef HAS_EIGEN
#include <Eigen/Dense>
#endif
#include <utility>
#include <vector>
#include <algorithm>
#include <fstream>

const char* name = "Triangles";
const char* desc = "Counts the triangles in a graph";
const char* url = 0;

enum Algo {
  nodeiterator,
  edgeiterator,
  hybrid,
  eigentriangle
};

namespace cll = llvm::cl;
static cll::opt<std::string> inputFilename(cll::Positional, cll::desc("<input file>"), cll::Required);
static cll::opt<Algo> algo("algo", cll::desc("Choose an algorithm:"),
    cll::values(
      clEnumValN(Algo::nodeiterator, "nodeiterator", "Node Iterator (default)"),
      clEnumValN(Algo::edgeiterator, "edgeiterator", "Edge Iterator"),
      clEnumValN(Algo::hybrid, "hybrid", "Hybrid node iterator and matrix multiply algorithm"),
      clEnumValN(Algo::eigentriangle, "eigentriangle", "Approximate eigen triangle algorithm"),
      clEnumValEnd), cll::init(Algo::nodeiterator));

typedef Galois::Graph::LC_Linear_Graph<uint32_t,void>
  ::with_numa_alloc<true>::type
  ::with_no_lockable<true>::type Graph;
//typedef Galois::Graph::LC_CSR_Graph<uint32_t,void> Graph;
//typedef Galois::Graph::LC_Linear_Graph<uint32_t,void> Graph;

typedef Graph::GraphNode GNode;

Graph graph;

/**
 * Like std::lower_bound but doesn't dereference iterators. Returns the first element
 * for which comp is not true. 
 */
template<typename Iterator, typename Compare>
Iterator lowerBound(Iterator first, Iterator last, Compare comp) {
  Iterator it;
  typename std::iterator_traits<Iterator>::difference_type count, half;
  count = std::distance(first, last);
  while (count > 0) {
    it = first; half = count / 2; std::advance(it, half);
    if (comp(it)) {
      first = ++it;
      count -= half + 1;
    } else {
      count = half;
    }
  }
  return first;
}

/**
 * std::set_intersection over edge_iterators.
 */
template<typename G>
size_t countEqual(G& g, typename G::edge_iterator aa, typename G::edge_iterator ea, typename G::edge_iterator bb, typename G::edge_iterator eb) {
  size_t retval = 0;
  while (aa != ea && bb != eb) {
    typename G::GraphNode a = g.getEdgeDst(aa);
    typename G::GraphNode b = g.getEdgeDst(bb);
    if (a < b) {
      ++aa;
    } else if (b < a) {
      ++bb;
    } else {
      retval += 1;
      ++aa; ++bb;
    }
  }
  return retval;
}

template<typename G>
struct LessThan {
  G& g;
  typename G::GraphNode n;
  LessThan(G& g, typename G::GraphNode n): g(g), n(n) { }
  bool operator()(typename G::edge_iterator it) {
    return g.getEdgeDst(it) < n;
  }
};

template<typename G>
struct GreaterThanOrEqual {
  G& g;
  typename G::GraphNode n;
  GreaterThanOrEqual(G& g, typename G::GraphNode n): g(g), n(n) { }
  bool operator()(typename G::edge_iterator it) {
    return !(n < g.getEdgeDst(it));
  }
};

template<typename G>
struct DegreeLess: public std::binary_function<typename G::GraphNode,typename G::GraphNode,bool> {
  typedef typename G::GraphNode N;
  G* g;
  DegreeLess(G& g): g(&g) { }

  bool operator()(const N& n1, const N& n2) const {
    return std::distance(g->edge_begin(n1), g->edge_end(n1)) < std::distance(g->edge_begin(n2), g->edge_end(n2));
  }
};

template<typename G>
struct GetDegree: public std::unary_function<typename G::GraphNode, ptrdiff_t> {
  typedef typename G::GraphNode N;
  G* g;
  GetDegree(G& g): g(&g) { }

  ptrdiff_t operator()(const N& n) const {
    return std::distance(g->edge_begin(n), g->edge_end(n));
  }
};

template<typename GraphNode,typename EdgeTy>
struct IdLess {
  bool operator()(const Galois::Graph::EdgeSortValue<GraphNode,EdgeTy>& e1, const Galois::Graph::EdgeSortValue<GraphNode,EdgeTy>& e2) const {
    return e1.dst < e2.dst;
  }
};


/**
 * Node Iterator algorithm for counting triangles.
 * <code>
 * for (v in G) 
 *   for (all pairs of neighbors (a, b) of v)
 *     if ((a,b) in G and a < v < b)
 *       triangle += 1
 * </code>
 *
 * Thomas Schank. Algorithmic Aspects of Triangle-Based Network Analysis. PhD
 * Thesis. Universitat Karlsruhe. 2007.
 */
struct NodeIteratorAlgo {
  Galois::GAccumulator<size_t> numTriangles;
  
  struct Process {
    NodeIteratorAlgo* self;
    Process(NodeIteratorAlgo* s): self(s) { }

    void operator()(const GNode& n, Galois::UserContext<GNode>&) { (*this)(n); }
    void operator()(const GNode& n) {
      // Partition neighbors
      // [first, ea) [n] [bb, last)
      Graph::edge_iterator first = graph.edge_begin(n, Galois::MethodFlag::NONE);
      Graph::edge_iterator last = graph.edge_end(n, Galois::MethodFlag::NONE);
      Graph::edge_iterator ea = lowerBound(first, last, LessThan<Graph>(graph, n));
      Graph::edge_iterator bb = lowerBound(first, last, GreaterThanOrEqual<Graph>(graph, n));

      for (; bb != last; ++bb) {
        GNode B = graph.getEdgeDst(bb);
        for (auto aa = first; aa != ea; ++aa) {
          GNode A = graph.getEdgeDst(aa);
          Graph::edge_iterator vv = graph.edge_begin(A, Galois::MethodFlag::NONE);
          Graph::edge_iterator ev = graph.edge_end(A, Galois::MethodFlag::NONE);
          Graph::edge_iterator it = lowerBound(vv, ev, LessThan<Graph>(graph, B));
          if (it != ev && graph.getEdgeDst(it) == B) {
            self->numTriangles += 1;
          }
        }
      }
    }
  };

  void operator()() { 
    Galois::do_all_local(graph, Process(this));
    std::cout << "NumTriangles: " << numTriangles.reduce() << "\n";
  }
};

#ifdef HAS_EIGEN
/**
 * AYZ algorithm. Combine node iterator algorithm with matrix multiplication.
 * Divide nodes into two categories. Low and high degree ones. Apply node
 * iterator to low degree nodes and matrix multiplication for high degree ones.
 *
 * Node iterator finds triangles such that a < v < b where v is the current
 * node. When we divide nodes into low (v_l) and high (v_h), there are four
 * cases:
 *  (1) v_l < v_l < v_l  ("a < v < b")
 *  (2) v_l < v_l < v_h
 *  (3) v_l < v_h < v_h
 *  (4) v_h < v_h < v_h
 * We divide work by the class of the middle node. In the following code,
 * ProcessLow handles the first three cases and ProcessHigh the last.
 *
 * Thomas Schank. Algorithmic Aspects of Triangle-Based Network Analysis. PhD
 * Thesis. Universitat Karlsruhe. 2007.
 */
struct HybridAlgo {
  typedef Eigen::Matrix<int, Eigen::Dynamic, Eigen::Dynamic> Matrix;

  Galois::GAccumulator<size_t> numTriangles;
  Matrix adjacency;

  //! Since nodes are sorted by degree, we can classify nodes based on comparison with node id
  GNode limit;
  Graph::iterator limitIterator;
  int numHighNodes;

  //! Node iterator algorithm + populate 
  template<bool HasLimit>
  struct ProcessLow {
    typedef int tt_does_not_need_aborts;
    HybridAlgo* self;
    ProcessLow(HybridAlgo* s): self(s) { }

    void operator()(const GNode& n, Galois::UserContext<GNode>&) { (*this)(n); }
    void operator()(const GNode& n) {
      // Partition neighbors
      // [first, ea) [n] [bb, last)
      Graph::edge_iterator first = graph.edge_begin(n, Galois::MethodFlag::NONE);
      Graph::edge_iterator last = graph.edge_end(n, Galois::MethodFlag::NONE);
      Graph::edge_iterator ea = lowerBound(first, last, LessThan<Graph>(graph, n));
      Graph::edge_iterator bb = lowerBound(first, last, GreaterThanOrEqual<Graph>(graph, n));

      // If there is a limit, only process the low degree "a" neighbors
      if (HasLimit) {
        ea = lowerBound(first, ea, LessThan<Graph>(graph, self->limit));
        last = lowerBound(bb, last, LessThan<Graph>(graph, self->limit)); // XXX
      }

      for (; bb != last; ++bb) {
        GNode B = graph.getEdgeDst(bb);
        for (auto aa = first; aa != ea; ++aa) {
          GNode A = graph.getEdgeDst(aa);
          Graph::edge_iterator vv = graph.edge_begin(A, Galois::MethodFlag::NONE);
          Graph::edge_iterator ev = graph.edge_end(A, Galois::MethodFlag::NONE);
          Graph::edge_iterator it = lowerBound(vv, ev, LessThan<Graph>(graph, B));
          if (it != ev && graph.getEdgeDst(it) == B) {
            self->numTriangles += 1;
          }
        }
      }
    }
  };

  struct WriteAdjacency {
    HybridAlgo* self;
    size_t limitIdx;

    WriteAdjacency(HybridAlgo* s): self(s) { 
      limitIdx = graph.getData(self->limit, Galois::MethodFlag::NONE);
    }

    void operator()(const GNode& n) {
      size_t nidx = graph.getData(n, Galois::MethodFlag::NONE) - limitIdx;
      for (Graph::edge_iterator edge : graph.out_edges(n, Galois::MethodFlag::NONE)) {
        GNode dst = graph.getEdgeDst(edge);
        if (dst < self->limit)
          continue;
        size_t didx = graph.getData(dst, Galois::MethodFlag::NONE) - limitIdx;
        self->adjacency(nidx, didx) = 1;
      }
    }
  };

  bool setLimit() {
    typedef boost::transform_iterator<GetDegree<Graph>, Graph::iterator> DegreeIterator;
    DegreeIterator first(graph.begin(), GetDegree<Graph>(graph));
    DegreeIterator last(graph.end(), GetDegree<Graph>(graph));

    int degreeLimit = static_cast<int>(sqrt(graph.size()));
    DegreeIterator it = std::lower_bound(first, last, degreeLimit);

    numHighNodes = 0;
    if (it == last)
      return false;

    limitIterator = it.base();
    limit = *limitIterator;
    numHighNodes = std::distance(limitIterator, graph.end());
    std::cout << "HighNodes: " << numHighNodes << ", DegreeLimit: " << degreeLimit << "\n";
    return true;
  }

  void operator()() {
    if (getenv("GALOIS_DO_NOT_BIND_MAIN_THREAD") == 0) {
      std::cerr << "To enable full parallelization, set environment variable GALOIS_DO_NOT_BIND_MAIN_THREAD=1\n";
    }
    Eigen::setNbThreads(numThreads);

    Galois::StatTimer Tlimit("SetLimitTime");
    Tlimit.start();
    bool hasLimit = setLimit();
    Tlimit.stop();

    if (hasLimit) {
      if (true) {
        std::cout << "Processing high degree nodes\n";
        adjacency.resize(numHighNodes, numHighNodes);
        adjacency.setZero();
        Galois::do_all(limitIterator, graph.end(), WriteAdjacency(this));
        // Compute matrix^3
        Galois::StatTimer Tmm("MMTime");
        Tmm.start();
        Matrix B, C;
        B.noalias() = adjacency * adjacency;
        C.noalias() = B * adjacency;
        Tmm.stop();

        size_t high = C.trace() / 6;
        std::cout << "NumHighTriangles: " << high << "\n";
        numTriangles += high;
      }
      std::cout << "Processing low degree nodes\n";
      Galois::for_each_local(graph, ProcessLow<true>(this));

    } else {
      Galois::for_each_local(graph, ProcessLow<false>(this));
    }
    std::cout << "NumTriangles: " << numTriangles.reduce() << "\n";
  }
};
#endif

/**
 * Edge Iterator algorithm for counting triangles.
 * <code>
 * for ((a, b) in E) 
 *   if (a < b)
 *     for (v in intersect(neighbors(a), neighbors(b)))
 *       if (a < v < b)
 *         triangle += 1
 * </code>
 *
 * Thomas Schank. Algorithmic Aspects of Triangle-Based Network Analysis. PhD
 * Thesis. Universitat Karlsruhe. 2007.
 */
struct EdgeIteratorAlgo {
  struct WorkItem {
    GNode src;
    GNode dst;
    WorkItem(const GNode& a1, const GNode& a2): src(a1), dst(a2) { }
  };

  Galois::InsertBag<WorkItem> items;
  Galois::GAccumulator<size_t> numTriangles;

  struct Initialize {
    EdgeIteratorAlgo* self;
    Initialize(EdgeIteratorAlgo* s): self(s) { }

    void operator()(GNode n) {
      for (Graph::edge_iterator edge : graph.out_edges(n, Galois::MethodFlag::NONE)) {
        GNode dst = graph.getEdgeDst(edge);
        if (n < dst)
          self->items.push(WorkItem(n, dst));
      }
    }
  };

  struct Process {
    typedef int tt_does_not_need_aborts;
    EdgeIteratorAlgo* self;
    Process(EdgeIteratorAlgo* s): self(s) { }

    void operator()(const WorkItem& w, Galois::UserContext<WorkItem>&) { (*this)(w); }
    void operator()(const WorkItem& w) {
      // Compute intersection of range (w.src, w.dst) in neighbors of w.src and w.dst
      Graph::edge_iterator abegin = graph.edge_begin(w.src, Galois::MethodFlag::NONE);
      Graph::edge_iterator aend = graph.edge_end(w.src, Galois::MethodFlag::NONE);
      Graph::edge_iterator bbegin = graph.edge_begin(w.dst, Galois::MethodFlag::NONE);
      Graph::edge_iterator bend = graph.edge_end(w.dst, Galois::MethodFlag::NONE);

      Graph::edge_iterator aa = lowerBound(abegin, aend, GreaterThanOrEqual<Graph>(graph, w.src));
      Graph::edge_iterator ea = lowerBound(abegin, aend, LessThan<Graph>(graph, w.dst));
      Graph::edge_iterator bb = lowerBound(bbegin, bend, GreaterThanOrEqual<Graph>(graph, w.src));
      Graph::edge_iterator eb = lowerBound(bbegin, bend, LessThan<Graph>(graph, w.dst));

      self->numTriangles += countEqual(graph, aa, ea, bb, eb);
    }
  };

  void operator()() { 
    Galois::do_all(graph.begin(), graph.end(), Initialize(this));
    Galois::for_each_local(items, Process(this));
    std::cout << "NumTriangles: " << numTriangles.reduce() << "\n";
  }
};

struct EigenTriangleAlgo {
  void operator()() { abort(); }
};

template<typename Algo>
void run() {
  Algo algo;

  Galois::StatTimer T;
  T.start();
  algo();
  T.stop();
}

void makeGraph(const std::string& triangleFilename) {
  typedef Galois::Graph::FileGraph G;
  typedef G::GraphNode N;

  G initial, permuted;

  initial.structureFromFileInterleaved<void>(inputFilename);
  
  // Getting around lack of resize for deque
  std::deque<N> nodes;
  std::copy(initial.begin(), initial.end(), std::back_inserter(nodes));
  // Sort by degree
  Galois::ParallelSTL::sort(nodes.begin(), nodes.end(), DegreeLess<G>(initial));
  
  std::deque<N> p;
  std::copy(nodes.begin(), nodes.end(), std::back_inserter(p));
  // Transpose
  size_t idx = 0;
  for (N n : nodes) {
    p[n] = idx++;
  }

  Galois::Graph::permute<void>(initial, p, permuted);
  Galois::do_all(permuted.begin(), permuted.end(), [&](N x) { permuted.sortEdges<void>(x, IdLess<N,void>()); });

  std::cout << "Writing new input file: " << triangleFilename << "\n";
  permuted.structureToFile(triangleFilename);
  Galois::Graph::readGraph(graph, permuted);
}

void readGraph() {
  if (inputFilename.find(".gr.triangles") != inputFilename.size() - strlen(".gr.triangles")) {
    // Not directly passed .gr.triangles file
    std::string triangleFilename = inputFilename + ".triangles";
    std::ifstream triangleFile(triangleFilename.c_str());
    if (!triangleFile.good()) {
      // triangles doesn't already exist, create it
      makeGraph(triangleFilename);
    } else {
      // triangles does exist, load it
      Galois::Graph::readGraph(graph, triangleFilename);
    }
  } else {
    Galois::Graph::readGraph(graph, inputFilename);
  }

  size_t index = 0;
  for (GNode n : graph) {
    graph.getData(n) = index++;
  }
}

int main(int argc, char** argv) {
  Galois::StatManager statManager;
  LonestarStart(argc, argv, name, desc, url);

  Galois::StatTimer Tinitial("InitializeTime");
  Tinitial.start();
  readGraph();
  Tinitial.stop();

  // XXX Test if preallocation matters
  Galois::reportPageAlloc("MeminfoPre");
  Galois::preAlloc(numThreads + 8 * Galois::Runtime::MM::numPageAllocTotal());
  Galois::reportPageAlloc("MeminfoMid");
  switch (algo) {
    case nodeiterator: run<NodeIteratorAlgo>(); break;
    case edgeiterator: run<EdgeIteratorAlgo>(); break;
#ifdef HAS_EIGEN
    case hybrid: run<HybridAlgo>(); break;
    case eigentriangle: run<EigenTriangleAlgo>(); break;
#endif
    default: std::cerr << "Unknown algo: " << algo << "\n";
  }
  Galois::reportPageAlloc("MeminfoPost");

  return 0;
}
