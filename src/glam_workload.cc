#include <iostream>
#include "glam_workload.hh"
#include <boost/graph/graphviz.hpp>
#include <boost/fusion/sequence.hpp>
#include <boost/fusion/include/sequence.hpp>

GLAMWorkload::GLAMWorkload()
{

}

GLAMWorkload::GLAMWorkload(graph_t *gg)
{
  glam_graph = gg;
  struct DotVertex dv;
  AddEntryNode();
  AddExitNode();
  std::string module_name = get_property(*glam_graph, &DotGraph::name);
  //llvm::Module *lm = new llvm::Module(module_name, l_context);
  //  glam_graph->l_module = 0;
  
  //  property_put(*glam_graph, &DotGraph::l_module, lm);
}


GLAMWorkload::~GLAMWorkload()
{
  delete glam_graph;
}

void GLAMWorkload::PrintGraph()
{
  std::cout<<"***********************************************"<<std::endl;
  std::cout<<get_property(*glam_graph, &DotGraph::name)<<std::endl;
  std::cout<<"***********************************************"<<std::endl;
  PrintVertices();
  PrintEdges();
}

void GLAMWorkload::PrintVertices()
{
  std::pair<vertex_iter, vertex_iter> vp;
  for (vp = vertices(*glam_graph); vp.first != vp.second; ++vp.first) {
    Vertex v = *vp.first;
    std::cout<<"Vertex ID: "<<v<<std::endl
	     <<(*glam_graph)[v]<<std::endl;
    std::cout<<"---------------------------------------------"<<std::endl;
  }
}

void GLAMWorkload::PrintEdges()
{
  std::pair<edge_iter, edge_iter> ep;
  for (ep = edges(*glam_graph); ep.first != ep.second; ++ep.first) {
    Edge e = *ep.first;
    std::cout<<"---------------------------------------------"<<std::endl;
    std::cout<<"Edge ID: "<<e<<std::endl
	     <<(*glam_graph)[e]<<std::endl;
    std::cout<<"---------------------------------------------"<<std::endl;
  }
}


Vertex GLAMWorkload::AddVertex(struct DotVertex dv)
{
  Vertex v;
  v = boost::add_vertex(*glam_graph);
  (*glam_graph)[v] = dv;
  return v;
}

void GLAMWorkload::AddEdge(struct DotEdge de, Vertex from, Vertex to)
{
  Edge e = (add_edge(from, to, *glam_graph)).first;
  (*glam_graph)[e] = de;
}

void GLAMWorkload::AddEntryNode()
{
  struct DotVertex dv;
  dv.label = "entry";
  Vertex entry = AddVertex(dv);


  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;
  de.label = "entry";
  AddEdge(de, entry, 0);
}

void GLAMWorkload::AddExitNode()
{
  struct DotVertex dv;
  dv.label = "exit";
  Vertex exit = AddVertex(dv);

  struct DotEdge de;
  de.label = "exit";
  de.type = EdgeTypes::UNCONDITIONAL;
  AddEdge(de, num_vertices(*glam_graph)-3, exit);

}
