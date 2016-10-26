#include "glam_workload.hh"
#include "block_visitor.hh"
#include "glam_basicblock.hh"
#include "glam_function.hh"

#include <boost/graph/graphviz.hpp>

#include <iostream>

#include <llvm/IR/Instructions.h>

void BranchVisitor::visit(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  std::vector<Vertex> vertices = g->GetOutNeighbours(gbb->g_vertex);
  if(vertices.size() == 1) {
    unconditional_branch(gbb,
			 (*g->glam_graph)[vertices[0]].g_block);
  } else if(vertices.size() == 2) {
    std::vector<GLAMBasicBlock *> targets;
    for(auto v : vertices)
      targets.push_back((*g->glam_graph)[v].g_block);
    conditional_branch(gbb, targets, g);
  }
}

void BranchVisitor::unconditional_branch(GLAMBasicBlock *source, GLAMBasicBlock *target)
{
  llvm::BranchInst::Create(target->l_block, source->l_block);
}

void BranchVisitor::conditional_branch(GLAMBasicBlock *source,
				       std::vector<GLAMBasicBlock *> targets,
				       GLAMWorkload *g)
{
  auto get_value = [this,&source](uint32_t val)
    {return llvm::ConstantInt::get(llvm::Type::getInt32Ty(source->l_block->getContext()),
				   val, false);};
  std::pair<Edge, bool> ep;
  int count;
  llvm::LoadInst* loaded_counter;
  unsigned true_index, false_index,i=0;
  GLAMBasicBlock* loop_prologue = g->get_loop_prologue(source->g_vertex);
  for (auto v : targets) {
    ep = boost::edge(source->g_vertex, v->g_vertex, *(g->glam_graph));
    assert(ep.second);
    if((*g->glam_graph)[ep.first].type == g->EdgeTypes::CONDITIONAL_COUNT) {
      true_index = i;
      count = (*g->glam_graph)[ep.first].condition;
      llvm::Instruction &inst = loop_prologue->l_block->front();
      unsigned opcode = inst.getOpcode();
      assert(opcode == llvm::Instruction::Alloca);
      loaded_counter = new llvm::LoadInst(&loop_prologue->l_block->front(), "", false);
    } else {
      false_index = i;
    }
    ++i;
  }
  llvm::ICmpInst* compare = new llvm::ICmpInst(llvm::ICmpInst::ICMP_ULT,
    					       loaded_counter, get_value(count), "");
  source->l_block->getInstList().push_back(loaded_counter);
  source->l_block->getInstList().push_back(compare);
  llvm::BranchInst::Create(targets[true_index]->l_block,
			   targets[false_index]->l_block,
			   compare, source->l_block);
}

void EntryExitVisitor::visit(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::PROLOGUE)
    entry(gbb, g);
  else if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::EPILOGUE)
    exit(gbb, g);
}

void EntryExitVisitor::entry(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  auto get_value = [this,&gbb,&g](uint32_t val)
    {return llvm::ConstantInt::get(g->ConvertToLLVMType((*g->glam_graph)[gbb->g_vertex].dataType),
				   val, false);};
  auto get_int_value = [this,&gbb](uint32_t val)
    {return llvm::ConstantInt::get(llvm::Type::getInt32Ty(gbb->l_block->getContext()),
				   val, false);};

  
  llvm::Function::arg_iterator args = g->g_function->l_function->arg_begin();

  llvm::Value* ptr = NULL;
  ptr = &(*args);
  llvm::AllocaInst* f_input = new llvm::AllocaInst(g->input, "");
  llvm::AllocaInst* entry_hook1 = new	llvm::AllocaInst(g->ConvertToLLVMType((*g->glam_graph)[0].dataType));
  llvm::AllocaInst* entry_hook2 = new	llvm::AllocaInst(g->ConvertToLLVMType((*g->glam_graph)[0].dataType));
  llvm::StoreInst* void_16 = new llvm::StoreInst(ptr, f_input, false);
  //LoadInst* l1 = new LoadInst(f_input, "", false);
  llvm::GetElementPtrInst* ptr_1 = llvm::GetElementPtrInst::Create(g->input, f_input, get_int_value(8));
  llvm::GetElementPtrInst* ptr_2 = llvm::GetElementPtrInst::Create(g->input, f_input, get_int_value(16));
  llvm::LoadInst* float_1 = new llvm::LoadInst(ptr_1, "", false);
  llvm::LoadInst* float_2 = new llvm::LoadInst(ptr_2, "", false);
  
  gbb->l_block->getInstList().push_back(f_input);
  gbb->l_block->getInstList().push_back(entry_hook1);
  gbb->l_block->getInstList().push_back(entry_hook2);
  gbb->l_block->getInstList().push_back(void_16);
  gbb->l_block->getInstList().push_back(ptr_1);
  gbb->l_block->getInstList().push_back(ptr_2);
  gbb->l_block->getInstList().push_back(float_1);
  gbb->l_block->getInstList().push_back(float_2);
}

void EntryExitVisitor::exit(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  gbb->l_block->getInstList().push_back(llvm::ReturnInst::Create(gbb->l_block->getContext()));
}

void LoopVisitor::visit(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::LOOP_PROLOGUE)
    prologue(gbb, g);
  else if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::LOOP_EPILOGUE)
    epilogue(gbb, g);
}

void LoopVisitor::prologue(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  
  auto get_value = [this,&gbb](uint32_t val)
    {return llvm::ConstantInt::get(llvm::Type::getInt32Ty(gbb->l_block->getContext()),
				   val, false);};
  loop_counter = new llvm::AllocaInst(llvm::IntegerType::get(gbb->l_block->getContext(), 32), "i");
  llvm::StoreInst* init_loop = new llvm::StoreInst(get_value(0), loop_counter, false);
  gbb->l_block->getInstList().push_back(loop_counter);
  gbb->l_block->getInstList().push_back(init_loop);

}

void LoopVisitor::epilogue(GLAMBasicBlock *gbb, GLAMWorkload *g)
{
  auto get_value = [this,&gbb](uint32_t val)
    {return llvm::ConstantInt::get(llvm::Type::getInt32Ty(gbb->l_block->getContext()),
				   val, false);};
  
  llvm::LoadInst* loaded_counter = new llvm::LoadInst(loop_counter, "", false);
  llvm::BinaryOperator* increment = llvm::BinaryOperator::Create(llvm::Instruction::Add, loaded_counter, get_value(1), "");
  llvm::StoreInst* store_counter = new llvm::StoreInst(increment, loop_counter, false);

  gbb->l_block->getInstList().push_back(loaded_counter);
  gbb->l_block->getInstList().push_back(increment);
  gbb->l_block->getInstList().push_back(store_counter);
}
