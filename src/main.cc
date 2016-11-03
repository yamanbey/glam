#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>

#include <boost/program_options.hpp>
#include <boost/tuple/tuple.hpp>

namespace po = boost::program_options;

#include "specification_reader.hh"
#include "glam_workload.hh"
#include "block_visitor.hh"
#include "logger.hh"

po::variables_map parse_args(int ac, char *av[])
{
  po::options_description desc("Options");
  desc.add_options()
    ("help,h", "print help message")
    ("function,F", po::value<std::string>(), "function definition input file")
    ("verbose,V", po::value<int>(), "level of verbosity [0-2] (ALL, INFO, ERROR)")
    ;

  po::variables_map vm;
  po::store(po::parse_command_line(ac, av, desc), vm);
  po::notify(vm);
  if(vm.count("help")) {
    std::cout<<desc<<"\n";
    exit(1);
  }
  return vm;
}
log4cxx::LoggerPtr logger;

log4cxx::LoggerPtr initialise_logger(log4cxx::LevelPtr verbose)
{
  log4cxx::FileAppender *fileAppender = new
    log4cxx::FileAppender(log4cxx::LayoutPtr(new log4cxx::SimpleLayout()),
			  "glam.log", false);
  log4cxx::helpers::Pool p;
  fileAppender->activateOptions(p);
  log4cxx::BasicConfigurator::configure(log4cxx::AppenderPtr(fileAppender));    
  log4cxx::Logger::getRootLogger()->setLevel(verbose);
  return log4cxx::Logger::getLogger("logger");
}

int main(int argc, char *argv[])
{
  auto result = EXIT_SUCCESS;
  auto verbose = Level::getInfo();
  try {
    auto vm = parse_args(argc, argv);

    if(vm.count("verbose"))
      verbose = Level::toLevel(vm["verbose"].as<int>()*20000);
    logger = initialise_logger(verbose);
    if(vm.count("function")) {
      std::string functionFile = vm["function"].as<std::string>();
      LOG4CXX_INFO(logger, "Reading function file: "<<functionFile);
      auto sr = SpecificationReaderFactory::GetReader(functionFile);
      assert(sr != 0);
      GLAMWorkload* function = sr->ConvertToGLAM();
      function->ConvertToLLVM();
      function->SetLogger(logger);
      function->PrintGraph();
      delete function;
      delete sr;
    }
    LOG4CXX_INFO(logger, "Exiting application.");
  }
  catch(Exception&) {
    result = EXIT_FAILURE;
  }
  return result;
}
