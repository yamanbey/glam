#include <iostream>
#include "glam_workload.hh"
#include <boost/graph/graphviz.hpp>
#include <boost/fusion/sequence.hpp>
#include <boost/fusion/include/sequence.hpp>
#include <boost/graph/topological_sort.hpp>
#include "glam_function.hh"
#include "glam_basicblock.hh"
#include "block_visitor.hh"

GLAMWorkload::GLAMWorkload()
{

}

GLAMWorkload::GLAMWorkload(graph_t *gg)
{
  glam_graph = gg;
  std::pair<vertex_iter, vertex_iter> vp;
  for (vp = vertices(*glam_graph); vp.first != vp.second; ++vp.first) {
    Vertex v = *vp.first;
    (*glam_graph)[v].type = DotVertex::VertexTypes::REGULAR;
  }


  initial_node_count = num_vertices(*glam_graph);
  AddEntryNode();
  AddExitNode();
  GenerateLoopNodes();
  final_node_count = num_vertices(*glam_graph);
}

void GLAMWorkload::ConvertToLLVM()
{
  GenerateLLVMModule();
  GenerateLLVMFunction();
  GenerateBasicBlocks();
  GenerateVisitors();
  FillBasicBlocks();
  l_module->dump();
}

GLAMWorkload::~GLAMWorkload()
{
  for(auto *r : block_visitors)
    delete r;
  std::pair<vertex_iter, vertex_iter> vp;
  for (vp = vertices(*glam_graph); vp.first != vp.second; ++vp.first) {
    Vertex v = *vp.first;
    delete (*glam_graph)[v].g_block;
  }

  delete g_function;
  delete glam_graph;
}

void GLAMWorkload::FillBasicBlocks()
{
  std::pair<vertex_iter, vertex_iter> vp;
  for (vp = vertices(*glam_graph); vp.first != vp.second; ++vp.first) {
    Vertex v = *vp.first;
    for (auto bv : block_visitors)
      (*glam_graph)[v].g_block->accept(bv, this);
  }
}

void GLAMWorkload::GenerateVisitors()
{
  block_visitors.push_back(new EntryExitVisitor);
  block_visitors.push_back(new LoopVisitor);
  block_visitors.push_back(new BranchVisitor);

}

void GLAMWorkload::GenerateLLVMModule()
{
  std::string module_name = get_property(*glam_graph, &DotGraph::name);
  l_module = new llvm::Module(module_name, l_context);
}

void GLAMWorkload::GenerateLLVMFunction()
{
  llvm::Type *rt = 
    ConvertToLLVMType((*glam_graph)[initial_node_count-1].dataType);

  input = ConvertToLLVMType((*glam_graph)[0].dataType+"ptr");
  std::vector<llvm::Type*> inputs;
  inputs.push_back(input);
  g_function = new GLAMFunction(rt, inputs, l_module);
}

void GLAMWorkload::GenerateBasicBlocks()
{
  std::pair<vertex_iter, vertex_iter> vp;
  for (vp = vertices(*glam_graph); vp.first != vp.second; ++vp.first) {
    Vertex v = *vp.first;
    (*glam_graph)[v].g_block = new GLAMBasicBlock(&l_context, v, this);
  }
}

void GLAMWorkload::PrintGraph()
{
  LOG4CXX_DEBUG(logger, "***********************************************");
  LOG4CXX_DEBUG(logger,""<<get_property(*glam_graph, &DotGraph::name));
  LOG4CXX_DEBUG(logger,"***********************************************");
  PrintVertices();
  PrintEdges();
}

void GLAMWorkload::PrintVertices()
{
  std::pair<vertex_iter, vertex_iter> vp;
  for (vp = vertices(*glam_graph); vp.first != vp.second; ++vp.first) {
    Vertex v = *vp.first;
    LOG4CXX_DEBUG(logger,"Vertex ID: "<<v<<std::endl
		  <<(*glam_graph)[v]
		  <<"\nout degree: "<<boost::out_degree(v,*glam_graph));

  }
}

void GLAMWorkload::PrintEdges()
{
  std::pair<edge_iter, edge_iter> ep;
  for (ep = edges(*glam_graph); ep.first != ep.second; ++ep.first) {
    Edge e = *ep.first;
    LOG4CXX_DEBUG(logger,""
		  <<"Edge ID: "<<e<<std::endl
		  <<(*glam_graph)[e]);
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
  dv.type = DotVertex::VertexTypes::PROLOGUE;
  Vertex entry = AddVertex(dv);
  
  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;
  AddEdge(de, entry, 0);
}

void GLAMWorkload::AddExitNode()
{
  struct DotVertex dv;
  dv.label = "exit";
  dv.type = DotVertex::VertexTypes::EPILOGUE;
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
  Vertex u,v,le,lp;
  for(std::vector<Edge>::iterator it=conditional_edges.begin();
      it != conditional_edges.end(); it++) {
    u = source(*it, *glam_graph);
    v = target(*it, *glam_graph);
    if(u > v) {
      // v: start of loop
      // u: conditional branch
      int counter = (*glam_graph)[*it].condition;
      remove_edge(*it, *glam_graph);
      lp = InsertLoopPrologue(v);
      le = InsertLoopEpilogue(u);
      loop_logues.push_back(std::make_pair(lp,le));
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

Vertex GLAMWorkload::InsertLoopPrologue(Vertex v)
{
  Vertex in_neighbour = GetInNeighbour(v);
  assert(in_neighbour>=0);
  Edge e = edge(in_neighbour,v,*glam_graph).first;
  remove_edge(e, *glam_graph);

  struct DotVertex dv;
  dv.label = "loop_prologue";
  dv.type = DotVertex::VertexTypes::LOOP_PROLOGUE;
  dv.dataType = (*glam_graph)[v].dataType;
  Vertex lp = AddVertex(dv);
  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;

  AddEdge(de, in_neighbour, lp);
  AddEdge(de, lp, v);
  return lp;
}

Vertex GLAMWorkload::GetInNeighbour(Vertex v)
{
  typedef std::vector< Vertex > container;
  container c;
  /* Can only run topological sort when the graph is acyclic */
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
  /* Can only run topological sort when the graph is acyclic */
  topological_sort(*glam_graph, std::back_inserter(c));

  for ( container::reverse_iterator ii=c.rbegin(); ii!=c.rend(); ++ii) {
    if(*ii == v)
      return *(++ii);
  }
  return -1;
}

std::vector<Vertex> GLAMWorkload::GetOutNeighbours(Vertex v)
{
  typedef std::vector< Vertex > container;
  std::pair<out_edge_iter,
	    out_edge_iter> ep;
  container vc;

  for(ep = out_edges(v, *glam_graph); ep.first != ep.second; ++ep.first) {
    Vertex v = target(*ep.first, *glam_graph);
    vc.push_back(v);
  }
  return vc;
}

Vertex GLAMWorkload::InsertLoopEpilogue(Vertex v)
{
  Vertex out_neighbour = GetOutNeighbour(v);
  assert(out_neighbour>=0);
  Edge e = edge(v,out_neighbour,*glam_graph).first;
  remove_edge(e, *glam_graph);

  struct DotVertex dv;
  dv.label = "loop_epilogue";
  dv.type = DotVertex::VertexTypes::LOOP_EPILOGUE;
  dv.dataType = (*glam_graph)[v].dataType;
  Vertex lp = AddVertex(dv);
  struct DotEdge de;
  de.type = EdgeTypes::UNCONDITIONAL;

  AddEdge(de, v, lp);
  AddEdge(de, lp, out_neighbour);
  return lp;
}

GLAMBasicBlock* GLAMWorkload::get_loop_prologue(Vertex v)
{
  Vertex prologue = 0xffffffff;
  for(auto i : loop_logues) {
    if(i.second == v)
      prologue = i.first;
  }
  assert(prologue != 0xffffffff);
  return (*glam_graph)[prologue].g_block;
}
