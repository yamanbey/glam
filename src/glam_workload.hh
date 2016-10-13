#include <boost/graph/adjacency_list.hpp>
#include <string>

struct DotVertex {
  std::string dataType;
  std::string distance;
  std::string operation;
  std::string stride;
  std::string length;
  std::string label;
  std::string dependency;
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

struct DotEdge {
  std::string label;
  std::string type;
  std::string condition;
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

typedef boost::adjacency_list<boost::vecS, boost::vecS, boost::directedS,
			      DotVertex, DotEdge, DotGraph> graph_t;

class GLAMWorkload
{
private:
  graph_t *glam_graph;
public:
  GLAMWorkload();
  GLAMWorkload(graph_t *gg);
  void PrintVertices();
  void PrintEdges();
  void PrintGraph();
  ~GLAMWorkload();
};
