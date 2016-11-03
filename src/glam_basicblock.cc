#include "glam_basicblock.hh"
#include "glam_function.hh"
#include "block_visitor.hh"
GLAMBasicBlock::GLAMBasicBlock()
{
  /* Context, name, function, 0 
  l_block = llvm::BasicBlock::Create(p_function->getLLVMModule()->getContext(), name(),
				     p_function->getLLVMFunction().get(), 0);
  */
  
}

GLAMBasicBlock::GLAMBasicBlock(llvm::LLVMContext *lc,
			       Vertex v,
			       GLAMWorkload *gwl)
{
  this->l_block = llvm::BasicBlock::Create(gwl->l_context,
				     (*(gwl->glam_graph))[v].label,
				     gwl->g_function->l_function,
				     0);
  this->g_wl = gwl;
  this->g_vertex = v;
				     
}

GLAMBasicBlock::~GLAMBasicBlock()
{

}

void GLAMBasicBlock::accept(BlockVisitor *bv)
{
  bv->visit(this);
}
