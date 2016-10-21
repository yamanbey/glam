#include <llvm/IR/BasicBlock.h>
#include "glam_workload.hh"
class GLAMBasicBlock
{
private:
  llvm::BasicBlock *l_block;
public:
  GLAMBasicBlock();
  GLAMBasicBlock(llvm::LLVMContext *lc,
		 Vertex v,
		 GLAMWorkload *g_w
		 );
  ~GLAMBasicBlock();
};
