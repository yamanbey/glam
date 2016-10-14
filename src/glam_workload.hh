#include <boost/graph/adjacency_list.hpp>
#include <string>
#include <boost/fusion/adapted/struct/adapt_struct.hpp>
#include <boost/fusion/include/adapt_struct.hpp>

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>

struct DotVertex {
  std::string dataType;
  int distance;
  std::string operation;
  int stride;
  int length;
  std::string label;
  std::string dependency;
  llvm::BasicBlock *lo_block;
  friend std::ostream& operator <<(std::ostream& os, DotVertex const& a)
  {
    return os << "dataType: "<<a.dataType << '\n'
	      << "distance: "<<a.distance << '\n'
	      << "operation: "<<a.operation << '\n'
      	      << "stride: "<<a.stride << '\n'
      	      << "length: "<<a.length << '\n'
      	      << "label: "<<a.label << '\n'
      	      << "dependency: "<<a.dependency;
  }
};

BOOST_FUSION_ADAPT_STRUCT(
			  DotVertex,
			  (std::string, dataType)
			  (int, distance)
			  (std::string, operation)
			  (int, stride)
			  (int, length)
			  (std::string, label)
			  (std::string, dependency)
			  )

struct DotEdge {
  std::string label;
  int type;
  int condition;
  friend std::ostream& operator <<(std::ostream& os, DotEdge const& a)
  {
    return os << "label: "<<a.label << '\n'
	      << "type: "<<a.type << '\n'
	      << "condition: "<<a.condition;
  }

};

struct DotGraph {
  std::string name;
  llvm::Module *l_module;
};

typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS,
			      DotVertex, DotEdge, DotGraph> graph_t;

typedef boost::graph_traits<graph_t>::vertex_descriptor Vertex;
typedef boost::graph_traits<graph_t>::edge_descriptor Edge;
typedef boost::graph_traits<graph_t>::vertex_iterator vertex_iter;
typedef boost::graph_traits<graph_t>::edge_iterator edge_iter;

class GLAMWorkload
{

private:
  graph_t *glam_graph;
  llvm::LLVMContext l_context;
protected:
  enum EdgeTypes {UNCONDITIONAL=0, CONDITIONAL_COUNT};
public:
  GLAMWorkload();
  GLAMWorkload(graph_t *gg);
  Vertex AddVertex(struct DotVertex dv);
  void AddEdge(struct DotEdge de, Vertex from, Vertex to);
  void AddEntryNode();
  void AddExitNode();
  void PrintVertices();
  void PrintEdges();
  void PrintGraph();
  ~GLAMWorkload();
};
