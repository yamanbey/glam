#include <boost/graph/adjacency_list.hpp>
#include <string>
#include <boost/fusion/adapted/struct/adapt_struct.hpp>
#include <boost/fusion/include/adapt_struct.hpp>
#include <boost/assign/list_of.hpp>
#include <boost/unordered_map.hpp>

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
class GLAMFunction;

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
};

typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::bidirectionalS,
			      DotVertex, DotEdge, DotGraph> graph_t;

typedef boost::graph_traits<graph_t>::vertex_descriptor Vertex;
typedef boost::graph_traits<graph_t>::edge_descriptor Edge;
typedef boost::graph_traits<graph_t>::vertex_iterator vertex_iter;
typedef boost::graph_traits<graph_t>::edge_iterator edge_iter;
typedef boost::graph_traits<graph_t>::adjacency_iterator adjacency_iterator;

class GLAMWorkload
{
private:
  graph_t *glam_graph;
  llvm::LLVMContext l_context;
  llvm::Module *l_module;

  /* TODO: Move this onto Graph Property Bundle when a way to modify it is found */
  GLAMFunction *g_function;
  typedef  boost::unordered_map<std::string,
				llvm::Type*(*)(llvm::LLVMContext &)>::const_iterator TypeFunctionIterator;
  const boost::unordered_map<std::string,
			     llvm::Type*(*)(llvm::LLVMContext &)>
  StringTolltypePtr = boost::assign::map_list_of
    ("void", &(llvm::Type::getVoidTy))
    ("label", &(llvm::Type::getLabelTy))
    ("half", &(llvm::Type::getHalfTy))
    ("float", &(llvm::Type::getFloatTy))
    ("double", &(llvm::Type::getDoubleTy))
    ("int32", reinterpret_cast<llvm::Type *(*)(llvm::LLVMContext &)>(&(llvm::Type::getInt32Ty)))
    ("int64", reinterpret_cast<llvm::Type *(*)(llvm::LLVMContext &)>(&(llvm::Type::getInt64Ty)))
    ("halfptr", reinterpret_cast<llvm::Type *(*)(llvm::LLVMContext &)>(&(llvm::Type::getHalfPtrTy)))
    ("floatptr", reinterpret_cast<llvm::Type *(*)(llvm::LLVMContext &)>(&(llvm::Type::getFloatPtrTy)))
    ("doubleptr", reinterpret_cast<llvm::Type *(*)(llvm::LLVMContext &)>(&(llvm::Type::getDoublePtrTy)))
    ("int64ptr", reinterpret_cast<llvm::Type *(*)(llvm::LLVMContext &)>(&(llvm::Type::getInt64PtrTy)))
    ;

protected:
  enum EdgeTypes {UNCONDITIONAL=0, CONDITIONAL_COUNT};
public:
  GLAMWorkload();
  GLAMWorkload(graph_t *gg);
  Vertex AddVertex(struct DotVertex dv);
  void AddEdge(struct DotEdge de, Vertex from, Vertex to);
  void AddNode(std::string label, Vertex id);
  void AddEntryNode();
  void AddExitNode();
  void GenerateLoopNodes();
  void PrintVertices();
  void PrintEdges();
  void PrintGraph();
  void InsertLoopPrologue(Vertex v);
  Vertex InsertLoopEpilogue(Vertex v);
  Vertex GetInNeighbour(Vertex v);
  Vertex GetOutNeighbour(Vertex v);
  ~GLAMWorkload();
  llvm::Type* ConvertToLLVMType(std::string s);
  std::vector<Edge> GetConditionalEdges();
};
