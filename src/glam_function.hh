#include <llvm/IR/Function.h>
#include <vector>

class GLAMFunction
{
private:
  llvm::FunctionType *function_type;

public:
  GLAMFunction();
  GLAMFunction(llvm::Type* return_type, std::vector<llvm::Type*> input_types, llvm::Module* lm);
  ~GLAMFunction();

  /* TODO: take care of these, either by friending or get/setters */
  llvm::Function *l_function;
};
