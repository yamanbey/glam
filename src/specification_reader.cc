#include "specification_reader.hh"
#include "logger.hh"
#include "glam_workload.hh"
#include <iostream>
#include <boost/graph/graphviz.hpp>

SpecificationReader::SpecificationReader()
{
  
}

SpecificationReader::~SpecificationReader()
{

}

SpecificationReader* SpecificationReaderFactory::GetReader(std::string filename)
{
  std::string::size_type idx = filename.rfind('.');
  if(idx != std::string::npos) {
    std::string extension = filename.substr(idx+1);
    if(extension == "dot") {
      return new DOTSpecificationReader(filename);
    }
  } else {
    return 0;
  }
  return 0;
}

DOTSpecificationReader::DOTSpecificationReader()
{

}

DOTSpecificationReader::DOTSpecificationReader(std::string filename)
{
  specification_file = filename;
}

DOTSpecificationReader::~DOTSpecificationReader()
{
  
}

GLAMWorkload* SpecificationReader::ConvertToGLAM()
{
  return convert();
}

GLAMWorkload* DOTSpecificationReader::convert()
{
  LOG4CXX_INFO(logger, "DOTSpecificationReader for "<<specification_file);
  graph_t *graphviz = new graph_t;
  boost::dynamic_properties dp(boost::ignore_other_properties);
  boost::ref_property_map<graph_t *, std::string> dg_name(get_property(*graphviz, &DotGraph::name));
  dp.property("label",       dg_name);
  
  dp.property("label",       boost::get(&DotVertex::label,         *graphviz));
  dp.property("data_type",       boost::get(&DotVertex::dataType,         *graphviz));
  dp.property("distance",       boost::get(&DotVertex::distance,         *graphviz));
  dp.property("operation",       boost::get(&DotVertex::distance,         *graphviz));
  dp.property("stride",       boost::get(&DotVertex::stride,         *graphviz));
  dp.property("dependency",       boost::get(&DotVertex::dependency,         *graphviz));
  dp.property("length",       boost::get(&DotVertex::length,         *graphviz));
  dp.property("label",       boost::get(&DotEdge::label,           *graphviz));
  dp.property("type",       boost::get(&DotEdge::type,           *graphviz));
  dp.property("condition",       boost::get(&DotEdge::condition,           *graphviz));
  
  std::ifstream ifs(specification_file);
  boost::read_graphviz(ifs, *graphviz, dp);
  return new GLAMWorkload(graphviz);
}
