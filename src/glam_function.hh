#include <llvm/IR/Function.h>
#include <vector>

class GLAMFunction
{
private:
  llvm::FunctionType *function_type;
  llvm::Function *l_function;
public:  
  GLAMFunction();
  GLAMFunction(llvm::Type* return_type, std::vector<llvm::Type*> input_types, llvm::Module* lm);
  ~GLAMFunction();
};
