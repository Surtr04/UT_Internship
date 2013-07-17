/** Parallel MST application -*- C++ -*-
 * @file
 * @section License
 *
 * Galois, a framework to exploit amorphous data-parallelism in irregular
 * programs.
 *
 * Copyright (C) 2012, The University of Texas at Austin. All rights reserved.
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
 * @author Rashid Kaleem <rashid@cs.utexas.edu>
 */
#include "Galois/Galois.h"
#include "Galois/Accumulator.h"
#include "Galois/Statistic.h"
#include "Galois/Timer.h"
#include "Galois/Queue.h"
#include "Galois/UserContext.h"
#include "Galois/Graph/Graph.h"
#include "Galois/Graph/LCGraph.h"
#include "llvm/Support/CommandLine.h"
#include "Lonestar/BoilerPlate.h"

#include <limits>
#include <algorithm>
#include <vector>
#include <iostream>

namespace cll = llvm::cl;
 
static const char* name = "Parallel MST";
static const char* desc = "Computes the Minimal Spanning Tree using combination of "
  "Boruvka's and Prim's algorithm";
static const char* url = 0;

static cll::opt<std::string> filename(cll::Positional, cll::desc("<input file>"), cll::Required);
static cll::opt<int> algo("algo", cll::desc("Algorithm to use"), cll::init(0));


typedef int Weight;
typedef Galois::GAccumulator<size_t> MstWeight;

struct Prim {
  struct Node;

  typedef Galois::Graph::FirstGraph<Node*, Weight, true> Graph;
  typedef Graph::GraphNode GraphNode;

  struct HeapItem {
    GraphNode node;
    Weight weight;
    HeapItem() { }
    HeapItem(GraphNode n): node(n), weight(std::numeric_limits<int>::max()) { }
    HeapItem(GraphNode n, Weight w): node(n), weight(w) { }
    bool operator<(const HeapItem& other) const {
      return weight < other.weight;
    }
  };

  typedef Galois::PairingHeap<HeapItem, std::less<HeapItem>,
          Galois::PerIterAllocTy::rebind<HeapItem>::other> Heap;

  struct Node {
    GraphNode parent;
    Heap::Handle handle;
    int id;
    bool present;
    Node(Heap::Handle h): handle(h), present(true) { }
  };

  typedef Galois::PerIterAllocTy::rebind<Node>::other NodeAlloc;

  std::string name() { return std::string("Serial Prim"); }

  void expandNeighborhood(Graph& g, const GraphNode& src) {
    
  }

  void doIt(Graph& g, const GraphNode& root, Galois::UserContext<GraphNode>& ctx, 
      MstWeight& mstWeight) {
    //Heap heap(5, ctx.getPerIterAlloc());
    Heap heap(ctx.getPerIterAlloc());
    NodeAlloc nodeAlloc(ctx.getPerIterAlloc());

    int i = 0;
    for (Graph::iterator ii = g.begin(), ei = g.end(); ii != ei; ++ii) {
      Heap::Handle h;
      if (*ii != root)
        h = heap.add(HeapItem(*ii));
      else
        h = heap.add(HeapItem(*ii, 0));
      NodeAlloc::pointer node = nodeAlloc.allocate(1);
      nodeAlloc.construct(node, Node(h));
      g.getData(*ii) = node;
      node->id = i++;
    }

    Galois::optional<HeapItem> retval = heap.pollMin();
    while (retval) {
      GraphNode src = retval->node;
      //std::cout << " Got (" << retval.second.weight << "," << src.getData()->id << ")\n";
      for (Graph::edge_iterator jj = g.edge_begin(src),
          ej = g.edge_end(src); jj != ej; ++jj) {
        GraphNode dst = g.getEdgeDst(jj);
        Node* node = g.getData(dst);
        //std::cout << " Seeing " << node->id << " " 
        //  << heap.value(node->handle).node.getData()->id << " " 
        //  << heap.value(node->handle).weight << " " << "\n";
        if (node->present) {
          const Weight& w = g.getEdgeData(jj);
          HeapItem item = heap.value(node->handle);
          if (w < item.weight) {
            node->parent = src;
            //std::cout << " Decrease (" << item.weight << "," << item.node.getData()->id << ") to " 
            //  << w << "\n";
            heap.decreaseKey(node->handle, HeapItem(item.node, w));
          }
        }
      }
      
      g.getData(src)->present = false;

      retval = heap.pollMin();
    }

    for (Graph::iterator ii = g.begin(), ei = g.end(); ii != ei; ++ii) {
      if (*ii != root)
        mstWeight += g.getEdgeData(g.findEdge(*ii, g.getData(*ii)->parent));
      // Automatically reclaimed, but don't leave dangling pointers around
      g.getData(*ii) = NULL;
    }
  }

  struct Process {
    Prim& parent;
    Graph& g;
    MstWeight& mstWeight;
    Process(Prim& p, Graph& _g, MstWeight& m): parent(p), g(_g), mstWeight(m) { }
    void operator()(const GraphNode& root, Galois::UserContext<GraphNode>& ctx) {
      parent.doIt(g, root, ctx, mstWeight);
    }
  };

  void operator()(Graph& g, MstWeight& w) {
    GraphNode one[] = { *g.begin() };

    Galois::setActiveThreads(1);
    Galois::for_each(&one[0], &one[1], Process(*this, g, w));
  }
};


struct Boruvka {
  typedef Galois::Graph::FirstGraph<unsigned, Weight, true> Graph;
  typedef Graph::GraphNode GraphNode;
  typedef std::pair<GraphNode, Weight> Edge;
  typedef std::vector<Edge, Galois::PerIterAllocTy::rebind<Edge>::other> EdgeList;

  struct EdgeLess : public std::binary_function<const Edge&, const Edge&, bool> {
    bool operator()(const Edge& a, const Edge& b) {
      return a.first != b.first ? a.first < b.first : a.second < b.second;
    }
  };

  struct Indexer: public std::unary_function<const GraphNode&,unsigned> {
    const Graph& g;
    Indexer(const Graph& a): g(a) { }
    unsigned operator()(const GraphNode& n) const {
      return g.getData(n, Galois::MethodFlag::NONE);
    }
  };

  struct Less: public std::binary_function<const GraphNode&,const GraphNode&,bool> {
    const Graph& g;
    Less(const Graph& a): g(a) { }
    bool operator()(const GraphNode& lhs, const GraphNode& rhs) const {
      return g.getData(lhs, Galois::MethodFlag::NONE) < g.getData(rhs, Galois::MethodFlag::NONE);
    }
  };

  struct Greater: public std::binary_function<const GraphNode&,const GraphNode&,bool> {
    const Graph& g;
    Greater(const Graph& a): g(a) { }
    bool operator()(const GraphNode& lhs, const GraphNode& rhs) const {
      return g.getData(lhs, Galois::MethodFlag::NONE) > g.getData(rhs, Galois::MethodFlag::NONE);
    }
  };

  std::string name() { return std::string("Boruvka"); }

  void expandNeighborhood(Graph& g, const GraphNode& src) {
    g.edge_begin(src, Galois::MethodFlag::ALL);
  }

  std::pair<GraphNode, Weight> findMin(Graph& g, const GraphNode& src, Galois::MethodFlag flag) {
    Weight minWeight = std::numeric_limits<Weight>::max();
    GraphNode minNode;

    for (Graph::edge_iterator ii = g.edge_begin(src, flag), 
        ei = g.edge_end(src, flag); ii != ei; ++ii) {
      GraphNode dst = g.getEdgeDst(ii);
      
      const Weight& w = g.getEdgeData(ii);
      if (w < minWeight){
        minNode = dst;
        minWeight = w;
      }
    }

    return std::make_pair(minNode, minWeight);
  }

  GraphNode collapseEdge(Graph& g, GraphNode& a, GraphNode& b,
      Galois::UserContext<GraphNode>& ctx, Galois::MethodFlag flag) {
    EdgeList edges(ctx.getPerIterAlloc());

    for (Graph::edge_iterator ii = g.edge_begin(a, flag),
        ei = g.edge_end(a, flag); ii != ei; ++ii) {
      GraphNode dst = g.getEdgeDst(ii);
      if (dst != b) {
        edges.push_back(std::make_pair(dst, g.getEdgeData(ii)));
        --g.getData(dst, flag);
      }
    }

    for (Graph::edge_iterator ii = g.edge_begin(b, flag),
        ei = g.edge_end(b, flag); ii != ei; ++ii) {
      GraphNode dst = g.getEdgeDst(ii);
      if (dst != a) {
        edges.push_back(std::make_pair(dst, g.getEdgeData(ii)));
        --g.getData(dst, flag);
      }
    }

    g.removeNode(a, flag);
    g.removeNode(b, flag);

    std::sort(edges.begin(), edges.end(), EdgeLess());

    GraphNode n = g.createNode(Graph::node_type());
    g.addNode(n);
    GraphNode last;
    unsigned numNeighbors = 0;
    for (EdgeList::iterator ii = edges.begin(), ei = edges.end(); ii != ei; ++ii) {
      if (ii->first == last)
        continue;

      g.getEdgeData(g.addMultiEdge(n, ii->first, flag)) = ii->second;
      g.getEdgeData(g.addMultiEdge(ii->first, n, flag)) = ii->second;
      --g.getData(ii->first, flag);
      numNeighbors++;

      last = ii->first;
    }

    g.getData(n, flag) = numNeighbors;

    return n;
  }

  struct Process {
    Boruvka& parent;
    Graph& g;
    MstWeight& mstWeight;

    Process(Boruvka& p, Graph& _g, MstWeight& m): parent(p), g(_g), mstWeight(m) { }

    void operator()(GraphNode& src, Galois::UserContext<GraphNode>& ctx) {
      parent.expandNeighborhood(g, src);

      if (!g.containsNode(src))
        return;

      std::pair<GraphNode,Weight> minp = parent.findMin(g, src, Galois::MethodFlag::NONE);

      if (minp.second == std::numeric_limits<Weight>::max()) {
        g.removeNode(src, Galois::MethodFlag::NONE);
        return;
      }

      parent.expandNeighborhood(g, minp.first);
      
      GraphNode rep = parent.collapseEdge(g, src, minp.first, ctx, Galois::MethodFlag::NONE);
      mstWeight += minp.second;
      ctx.push(rep);
    }
  };

  void operator()(Graph& g, MstWeight& w) {
    for (Graph::iterator ii = g.begin(), ei = g.end(); ii != ei; ++ii) {
      g.getData(*ii) = std::distance(g.edge_begin(*ii), g.edge_end(*ii));
    }

    typedef Galois::WorkList::dChunkedFIFO<16> IChunk;

    Galois::for_each<IChunk>(g.begin(), g.end(), Process(*this, g, w));
  }
};


struct BoruvkaUnionFind {
  struct Data {
    int parent; // union-find parent
    int rank;   // union-find rank
    int next;   // linked list of nodes on perimeter
    Weight minWeight; 
    Data(): rank(0), next(-1), minWeight(std::numeric_limits<Weight>::max()) { }
  };

  typedef Galois::Graph::FirstGraph<Data, Weight, true> Graph;
  typedef Graph::GraphNode GraphNode;
  typedef std::vector<GraphNode> NodesTy;
  typedef std::pair<GraphNode,Weight> MinPairTy;

  std::string name() { return std::string("Boruvka Union Find"); }

  GraphNode find(const Graph& g, GraphNode n, const NodesTy& nodes, Galois::MethodFlag flag) const {
    GraphNode parent = nodes[g.getData(n, flag).parent];
    if (parent == n)
      return n;
    else
      return find(g, parent, nodes, flag);
  }

  //! Separate path compression from find so that we can defer writes after the
  //! fail-safe point
  GraphNode compressPath(const Graph& g, GraphNode n, const NodesTy& nodes) const {
    GraphNode parent = nodes[g.getData(n, Galois::MethodFlag::NONE).parent];
    if (parent == n)
      return n;
    else {
      GraphNode ret = compressPath(g, parent, nodes);
      g.getData(n, Galois::MethodFlag::NONE).parent = g.getData(ret, Galois::MethodFlag::NONE).parent;
      return ret;
    }
  }

  void mergeLists(const Graph& g, const GraphNode& a, const GraphNode& b, const NodesTy& nodes) const {
    GraphNode last = a;
    int aId = g.getData(a, Galois::MethodFlag::NONE).next;
    int bId = g.getData(b, Galois::MethodFlag::NONE).next;

    int bHeadId = g.getData(b, Galois::MethodFlag::NONE).parent;
    Weight wbh = g.getData(b, Galois::MethodFlag::NONE).minWeight;
    assert(wbh != std::numeric_limits<Weight>::max());

    bool found = false;
    while (true) {
      if (aId == -1 || bId == -1)
        break;

      Weight wa = g.getData(nodes[aId], Galois::MethodFlag::NONE).minWeight;
      Weight wb = g.getData(nodes[bId], Galois::MethodFlag::NONE).minWeight;

      assert(wa != std::numeric_limits<Weight>::max());
      assert(wb != std::numeric_limits<Weight>::max());

      int next;
      int less;
      if (wa > wb) {
        less = wb;
        next = bId;
        bId = g.getData(nodes[bId], Galois::MethodFlag::NONE).next;
      } else {
        less = wa;
        next = aId;
        aId = g.getData(nodes[aId], Galois::MethodFlag::NONE).next;
      }
      
      if (!found && wbh <= less) {
        g.getData(last, Galois::MethodFlag::NONE).next = bHeadId;
        last = nodes[bHeadId];
        found = true;
      }

      g.getData(last, Galois::MethodFlag::NONE).next = next;
      last = nodes[next];
    }

    if (aId == -1)
      g.getData(last, Galois::MethodFlag::NONE).next = bId;
    else 
      g.getData(last, Galois::MethodFlag::NONE).next = aId;

    // Check if we still need to find a place for bHead
    if (found)
      return;

    int rid = g.getData(last, Galois::MethodFlag::NONE).next;
    while (rid != -1 && wbh > g.getData(nodes[rid], Galois::MethodFlag::NONE).minWeight) {
      rid = g.getData(nodes[rid], Galois::MethodFlag::NONE).next;
      if (rid == -1)
        break;
      last = nodes[rid];
    }

    g.getData(last, Galois::MethodFlag::NONE).next = bHeadId;
    g.getData(nodes[bHeadId], Galois::MethodFlag::NONE).next = rid;
  }

  GraphNode merge(const Graph& g, GraphNode a, GraphNode b, const NodesTy& nodes) const {
    GraphNode repA = compressPath(g, a, nodes);
    GraphNode repB = compressPath(g, b, nodes);

    assert(repA != repB);

    Data& dA = g.getData(repA, Galois::MethodFlag::NONE);
    Data& dB = g.getData(repB, Galois::MethodFlag::NONE);

    if (dA.rank < dB.rank) {
      mergeLists(g, repB, repA, nodes);
      dA.parent = dB.parent;
      return repB;
    } else if (dA.rank > dB.rank) {
      mergeLists(g, repA, repB, nodes);
      dB.parent = dA.parent;
      return repA;
    } else {
      mergeLists(g, repA, repB, nodes);
      dB.parent = dA.parent;
      dA.rank += 1;
      return repA;
    }
  }


  bool findMin(Graph& g, GraphNode node, const NodesTy& nodes, MinPairTy& minp) const {
    minp.second = std::numeric_limits<Weight>::max();
    
    GraphNode rep = find(g, node, nodes, Galois::MethodFlag::CHECK_CONFLICT);
    //GraphNode rep = compressPath(node, nodes);
    GraphNode cur = rep;
    GraphNode last = cur;
    bool first = true;
    int next = g.getData(cur, Galois::MethodFlag::NONE).parent;

    while (true) {
      bool seen = false;
      Data& curData = g.getData(cur, Galois::MethodFlag::NONE);

      for (Graph::edge_iterator ii = g.edge_begin(cur, Galois::MethodFlag::CHECK_CONFLICT), 
	     ei = g.edge_end(cur, Galois::MethodFlag::CHECK_CONFLICT); ii != ei; ++ii) {
        GraphNode dst = g.getEdgeDst(ii);
        if (rep == find(g, dst, nodes, Galois::MethodFlag::CHECK_CONFLICT))
        //if (rep == compressPath(*dst, nodes))
          continue;

        seen = true;

        const Weight& w = g.getEdgeData(ii);

        // Should only happen first time someone sees this node
        if (w < curData.minWeight)
          curData.minWeight = w;

        if (w < minp.second) {
          minp.first = dst;
          minp.second = w;
        }
      }

      // Remove interior nodes
      if (seen) {
        // Safe, because !seen is a monotonic property
        if (last != cur)
          g.getData(last, Galois::MethodFlag::NONE).next = next;
        last = cur;
      }

      next = curData.next;

      if (next == -1)
        break;

      cur = nodes[next];

      // Check 2nd element in list as well
      if (!first && minp.second < g.getData(cur, Galois::MethodFlag::CHECK_CONFLICT).minWeight) {
        assert(g.getData(cur, Galois::MethodFlag::NONE).minWeight != std::numeric_limits<Weight>::max());
        return true;
      }

      first = false;
    } 
    
    return minp.second != std::numeric_limits<Weight>::max();
  }

  void updateMinWeight(Graph& g, GraphNode cur) const {
    Data& curData = g.getData(cur, Galois::MethodFlag::NONE);
    for (Graph::edge_iterator ii = g.edge_begin(cur, Galois::MethodFlag::NONE), 
        ei = g.edge_end(cur, Galois::MethodFlag::NONE); ii != ei; ++ii) {
      const Weight& w = g.getEdgeData(ii);
      // Should only happen first time someone sees this node
      if (w < curData.minWeight)
        curData.minWeight = w;
    }
  }

  struct Process {
    BoruvkaUnionFind& self;
    Graph& g;
    MstWeight& mstWeight;
    const NodesTy& nodes;

    Process(BoruvkaUnionFind& s, Graph& _g, MstWeight& m, const NodesTy& n):
      self(s), g(_g), mstWeight(m), nodes(n)
    { 
    
    }

    void operator()(GraphNode& src, Galois::UserContext<GraphNode>& ctx) {
      MinPairTy minp;
      
      if (!self.findMin(g, src, nodes, minp))
        return;

      if (g.getData(minp.first, Galois::MethodFlag::NONE).minWeight == std::numeric_limits<Weight>::max())
        self.updateMinWeight(g, minp.first);

      GraphNode rep = self.merge(g, src, minp.first, nodes);

      mstWeight += minp.second;
      ctx.push(rep);
    }
  };

  void operator()(Graph& g, MstWeight& w) {
    NodesTy nodes;
    std::copy(g.begin(), g.end(), std::back_inserter(nodes));
    std::random_shuffle(nodes.begin(), nodes.end());

    size_t size = nodes.size();

    for (size_t i = 0; i != size; ++i) {
      g.getData(nodes[i]).parent = i;
    }

    typedef Galois::WorkList::dChunkedFIFO<16> IChunk;

    Galois::for_each<IChunk>(nodes.begin(), nodes.end(), Process(*this, g, w, nodes));
  }
};



template<typename Graph>
void makeGraph(const std::string& in, Graph& g) {
  typedef typename Graph::GraphNode GraphNode;
  typedef Galois::Graph::LC_CSR_Graph<size_t, Weight> ReaderGraph;
  typedef ReaderGraph::GraphNode ReaderGNode;

  ReaderGraph reader;
  Galois::Graph::readGraph(reader, in);

  // Assign ids to ReaderGNodes
  size_t numNodes = 0;
  for (ReaderGraph::iterator ii = reader.begin(),
      ee = reader.end(); ii != ee; ++ii, ++numNodes) {
    ReaderGNode src = *ii;
    reader.getData(src) = numNodes;
  }

  // Create dense map between ids and GNodes
  std::vector<GraphNode> nodes;
  nodes.resize(numNodes);
  for (size_t i = 0; i < numNodes; ++i) {
    GraphNode src = g.createNode(typename Graph::node_type());
    g.addNode(src);
    nodes[i] = src;
  }

  // Create edges
  size_t numEdges = 0;
  for (ReaderGraph::iterator ii = reader.begin(),
      ei = reader.end(); ii != ei; ++ii) {
    ReaderGNode rsrc = *ii;
    int rsrcId = reader.getData(rsrc);
    for (ReaderGraph::edge_iterator jj = reader.edge_begin(rsrc),
        ej = reader.edge_end(rsrc); jj != ej; ++jj) {
      ReaderGNode rdst = reader.getEdgeDst(jj);
      int rdstId = reader.getData(rdst);
      const Weight& w = reader.getEdgeData(jj);
      GraphNode gsrc = nodes[rsrcId];
      GraphNode gdst = nodes[rdstId];

      if (g.findEdge(gsrc, gdst) != g.edge_end(gsrc)) {
        Weight& ww = g.getEdgeData(g.findEdge(gsrc, gdst));
        if (ww > w) {
          ww = w;
          g.getEdgeData(g.findEdge(gdst, gsrc)) = w;
        }
      } else if (gsrc != gdst) {
        g.addMultiEdge(gsrc, gdst, Galois::MethodFlag::ALL, w);
        g.addMultiEdge(gdst, gsrc, Galois::MethodFlag::ALL, w);
        numEdges += 2;
      }
    }
  }

  std::cout << "Read " << numNodes << " nodes and " << numEdges << " edges\n";
}

template<typename Algo>
void run(const std::string& in) {
  typedef typename Algo::Graph Graph;
  MstWeight w;
  Graph g;
  Algo algo;
  makeGraph<Graph>(in, g);

  std::cout << "Using " << algo.name() << "\n";
  Galois::StatTimer T;
  T.start();
  algo(g, w);
  T.stop();
  std::cout << "MST Weight is " << w.reduce() << "\n";
}

int main(int argc, char **argv) {
  LonestarStart(argc, argv, name, desc, url);

  switch (algo) {
  case 2: run<BoruvkaUnionFind>(filename); break;
  case 1: run<Prim>(filename); break;
  default:
  case 0: run<Boruvka>(filename); break;
  }

  return 0;
}
