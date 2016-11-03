#include <llvm/IR/BasicBlock.h>
#include "glam_workload.hh"

class BlockVisitor;
class GLAMBasicBlock
{
private:

public:
  llvm::BasicBlock* l_block;
  GLAMWorkload* g_wl;
  GLAMBasicBlock();
  GLAMBasicBlock(llvm::LLVMContext *lc,
		 Vertex v,
		 GLAMWorkload *gwl
		 );
  void accept(BlockVisitor *bv);
  Vertex g_vertex;
  ~GLAMBasicBlock();
};
