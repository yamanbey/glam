#include "glam_function.hh"
#include <llvm/IR/Module.h>

GLAMFunction::GLAMFunction()
{

}

GLAMFunction::GLAMFunction(llvm::Type* return_type,
			   std::vector<llvm::Type*> input_types,
			   llvm::Module* lm)
{
  function_type = llvm::FunctionType::get(return_type,
					  input_types,
					  false);
  l_function = llvm::Function::Create(function_type,
				      llvm::Function::ExternalLinkage,
				      llvm::Twine(lm->getName()),
				      lm
				      );
}

GLAMFunction::~GLAMFunction()
{

}

