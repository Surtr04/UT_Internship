/** Graph converter -*- C++ -*-
 * @file
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
 * @author Dimitrios Prountzos <dprountz@cs.utexas.edu>
 * @author Donald Nguyen <ddn@cs.utexas.edu>
 */
#include "Galois/LargeArray.h"
#include "Galois/Graph/FileGraph.h"

#include "llvm/Support/CommandLine.h"
#include <boost/random/mersenne_twister.hpp>
#include <boost/random/uniform_int_distribution.hpp>

#include <iostream>
#include <fstream>
#include <vector>
#include <string>

#include <fcntl.h>

namespace cll = llvm::cl;

static cll::opt<std::string> inputfilename(cll::Positional, cll::desc("<input file>"), cll::Required);
static cll::opt<std::string> outputfilename(cll::Positional, cll::desc("<output file>"), cll::Required);


static void printStatus(size_t in_nodes, size_t in_edges, size_t out_nodes, size_t out_edges) {
  std::cout << "InGraph : |V| = " << in_nodes << ", |E| = " << in_edges << "\n";
  std::cout << "OutGraph: |V| = " << out_nodes << ", |E| = " << out_edges << "\n";
}

static void printStatus(size_t in_nodes, size_t in_edges) {
  printStatus(in_nodes, in_edges, in_nodes, in_edges);
}




  typedef Galois::Graph::FileGraph Graph;
  typedef Graph::GraphNode GNode;

int main(int argc, char** argv) {
  llvm::cl::ParseCommandLineOptions(argc, argv);

  Graph graph;
  graph.structureFromFile(inputfilename);

  std::ofstream file(outputfilename.c_str());
  file << graph.size() << " " << graph.sizeEdges()/2 << "\n";
  for (Graph::iterator ii = graph.begin(), ei = graph.end(); ii != ei; ++ii) {
    GNode src = *ii;
    for (Graph::edge_iterator jj = graph.edge_begin(src), ej = graph.edge_end(src); jj != ej; ++jj) {
      GNode dst = graph.getEdgeDst(jj);
      file  << dst + 1 << " ";
    }
    file << "\n";
  }
  file.close();

  printStatus(graph.size(), graph.sizeEdges());

  return 0;
}
