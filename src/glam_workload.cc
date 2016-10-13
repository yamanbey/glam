#include <iostream>
#include "glam_workload.hh"
#include <boost/graph/graphviz.hpp>
GLAMWorkload::GLAMWorkload()
{

}

GLAMWorkload::GLAMWorkload(graph_t *gg)
{
  glam_graph = gg;
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
  typedef boost::graph_traits<graph_t>::vertex_descriptor Vertex;
  typedef boost::graph_traits<graph_t>::vertex_iterator vertex_iter;

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
  typedef boost::graph_traits<graph_t>::edge_descriptor Edge;
  typedef boost::graph_traits<graph_t>::edge_iterator edge_iter;
  std::pair<edge_iter, edge_iter> ep;
  for (ep = edges(*glam_graph); ep.first != ep.second; ++ep.first) {
    Edge e = *ep.first;
    std::cout<<"---------------------------------------------"<<std::endl;
    std::cout<<"Edge ID: "<<e<<std::endl
	     <<(*glam_graph)[e]<<std::endl;
    std::cout<<"---------------------------------------------"<<std::endl;
  }

}
