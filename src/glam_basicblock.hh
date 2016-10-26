#include <llvm/IR/BasicBlock.h>
#include "glam_workload.hh"

class BlockVisitor;
class GLAMBasicBlock
{
private:

public:
  llvm::BasicBlock *l_block;
  GLAMBasicBlock();
  GLAMBasicBlock(llvm::LLVMContext *lc,
		 Vertex v,
		 GLAMWorkload *g_w
		 );
  void accept(BlockVisitor *bv, GLAMWorkload *g);
  Vertex g_vertex;
  ~GLAMBasicBlock();
};
