#include <iostream>
#include "glam_workload.hh"
#include <boost/graph/graphviz.hpp>
#include <boost/fusion/sequence.hpp>
#include <boost/fusion/include/sequence.hpp>
#include <boost/graph/topological_sort.hpp>
#include "glam_function.hh"

GLAMWorkload::GLAMWorkload()
{

}

GLAMWorkload::GLAMWorkload(graph_t *gg)
{
  glam_graph = gg;
  struct DotVertex dv;
  int v_count = num_vertices(*glam_graph);
  AddEntryNode();
  AddExitNode();
  GenerateLoopNodes();
  std::string module_name = get_property(*glam_graph, &DotGraph::name);
  l_module = new llvm::Module(module_name, l_context);

  
  llvm::Type *rt =
    ConvertToLLVMType((*glam_graph)[v_count+2].dataType);
  llvm::Type *input =
    ConvertToLLVMType((*glam_graph)[0].dataType+"ptr");
  std::vector<llvm::Type*> inputs;
  inputs.push_back(input);
  g_function = new GLAMFunction(rt, inputs, l_module);
}

GLAMWorkload::~GLAMWorkload()
{
  delete g_function;
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
    std::cout<<"out degree: "<<boost::out_degree(v,*glam_graph)<<std::endl;
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
  AddEdge(de, entry, 0);
}

void GLAMWorkload::AddExitNode()
{
  struct DotVertex dv;
  dv.label = "exit";
  Vertex exit = AddVertex(dv);

  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;  
  AddEdge(de, num_vertices(*glam_graph)-3, exit);
}

void GLAMWorkload::AddNode(std::string label, Vertex id)
{
  /* TODO: remove or fix */
  struct DotVertex dv;
  dv.label = label;
  Vertex entry = AddVertex(dv);

  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;
  AddEdge(de, entry, id);

}

void GLAMWorkload::GenerateLoopNodes()
{
  std::vector<Edge> conditional_edges = GetConditionalEdges();
  Vertex u,v,le;
  for(std::vector<Edge>::iterator it=conditional_edges.begin();
      it != conditional_edges.end(); it++) {
    u = source(*it, *glam_graph);
    v = target(*it, *glam_graph);
    if(u > v) {
      // v: start of loop
      // u: conditional branch
      int counter = (*glam_graph)[*it].condition;
      remove_edge(*it, *glam_graph);
      InsertLoopPrologue(v);
      le = InsertLoopEpilogue(u);
      struct DotEdge de;
      de.type = EdgeTypes::CONDITIONAL_COUNT;
      de.condition = counter;
      AddEdge(de, le, v);
    }
  }
}

llvm::Type* GLAMWorkload::ConvertToLLVMType(std::string s)
{
  TypeFunctionIterator t = StringTolltypePtr.find(s);
  return (*(t->second))(l_context);
}

std::vector<Edge> GLAMWorkload::GetConditionalEdges()
{
  std::pair<edge_iter, edge_iter> ep;
  std::vector<Edge> conditional_edges;
  for (ep = edges(*glam_graph); ep.first != ep.second; ++ep.first) {
    Edge e = *ep.first;
    /* TODO: modify here to adopt to different branching behaviour / conditions */
    if((*glam_graph)[e].type == EdgeTypes::CONDITIONAL_COUNT) {
      conditional_edges.push_back(e);
    }
  }
  return conditional_edges;
}

void GLAMWorkload::InsertLoopPrologue(Vertex v)
{
  Vertex in_neighbour = GetInNeighbour(v);
  assert(in_neighbour>=0);
  Edge e = edge(in_neighbour,v,*glam_graph).first;
  remove_edge(e, *glam_graph);

  struct DotVertex dv;
  dv.label = "loop_prologue";
  dv.dataType = (*glam_graph)[v].dataType;
  Vertex lp = AddVertex(dv);
  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;

  AddEdge(de, in_neighbour, lp);
  AddEdge(de, lp, v);
}

Vertex GLAMWorkload::GetInNeighbour(Vertex v)
{
  typedef std::vector< Vertex > container;
  container c;
  topological_sort(*glam_graph, std::back_inserter(c));

  for ( container::reverse_iterator ii=c.rbegin(); ii!=c.rend(); ++ii) {
    if(*ii == v)
      return *(--ii);
  }
  return -1;
}

Vertex GLAMWorkload::GetOutNeighbour(Vertex v)
{
  typedef std::vector< Vertex > container;
  container c;
  topological_sort(*glam_graph, std::back_inserter(c));

  for ( container::reverse_iterator ii=c.rbegin(); ii!=c.rend(); ++ii) {
    if(*ii == v)
      return *(++ii);
  }
  return -1;
}

Vertex GLAMWorkload::InsertLoopEpilogue(Vertex v)
{
  Vertex out_neighbour = GetOutNeighbour(v);
  assert(out_neighbour>=0);
  Edge e = edge(v,out_neighbour,*glam_graph).first;
  remove_edge(e, *glam_graph);

  struct DotVertex dv;
  dv.label = "loop_epilogue";
  dv.dataType = (*glam_graph)[v].dataType;
  Vertex lp = AddVertex(dv);
  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;

  AddEdge(de, v, lp);
  AddEdge(de, lp, out_neighbour);
  return lp;
}
