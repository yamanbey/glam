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
			       GLAMWorkload *g_w)
{
  l_block = llvm::BasicBlock::Create(g_w->l_context,
				     (*(g_w->glam_graph))[v].label,
				     g_w->g_function->l_function,
				     0);
  g_vertex = v;
				     
}

GLAMBasicBlock::~GLAMBasicBlock()
{

}

void GLAMBasicBlock::accept(BlockVisitor *bv, GLAMWorkload *g)
{
  bv->visit(this, g);
}
