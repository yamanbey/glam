#include "glam_workload.hh"
#include "block_visitor.hh"
#include "glam_basicblock.hh"
#include "glam_function.hh"

#include <boost/graph/graphviz.hpp>
#include <boost/circular_buffer.hpp>

#include <iostream>
#include <cstdlib>
#include <llvm/IR/Instructions.h>

template <typename T>
llvm::Value* BlockVisitor::generate_loaded_constant(std::string str, T value)
{
  llvm::Type* constant_type = g_block->g_wl->ConvertToLLVMType(str);
  llvm::Value* v;
  if(str.find("int") != -1) {
    v = llvm::ConstantInt::get(constant_type, value, false);
  } else if(str.find("float") != -1) {
    v = llvm::ConstantFP::get(constant_type, value);
  } else if(str.find("double") != -1) {
    v = llvm::ConstantFP::get(constant_type, value);
  }
  llvm::AllocaInst* v_alloc = new llvm::AllocaInst(constant_type);
  llvm::StoreInst* v_store = new llvm::StoreInst(v, v_alloc, false);
  llvm::LoadInst* v_load = new llvm::LoadInst(v_alloc, "", false);
  g_block->l_block->getInstList().push_back(v_alloc);
  g_block->l_block->getInstList().push_back(v_store);
  g_block->l_block->getInstList().push_back(v_load);
  return v_load;
}

void BranchVisitor::visit_impl(GLAMBasicBlock *gbb)
{
  GLAMWorkload *g = gbb->g_wl;
  std::vector<Vertex> vertices = g->GetOutNeighbours(gbb->g_vertex);
  if(vertices.size() == 1) {
    unconditional_branch(gbb,
			 (*g->glam_graph)[vertices[0]].g_block);
  } else if(vertices.size() == 2) {
    std::vector<GLAMBasicBlock *> targets;
    for(auto v : vertices)
      targets.push_back((*g->glam_graph)[v].g_block);
    conditional_branch(gbb, targets);
  }
}

void BranchVisitor::unconditional_branch(GLAMBasicBlock *source, GLAMBasicBlock *target)
{
  llvm::BranchInst::Create(target->l_block, source->l_block);
}

void BranchVisitor::conditional_branch(GLAMBasicBlock *source,
				       std::vector<GLAMBasicBlock *> targets
				       )
{
  GLAMWorkload *g = source->g_wl;
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

void EntryExitVisitor::visit_impl(GLAMBasicBlock *gbb)
{
  GLAMWorkload *g = gbb->g_wl;
  if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::PROLOGUE)
    entry(gbb);
  else if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::EPILOGUE)
    exit(gbb);
}

void EntryExitVisitor::entry(GLAMBasicBlock *gbb)
{
  GLAMWorkload *g = gbb->g_wl;
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

void EntryExitVisitor::exit(GLAMBasicBlock *gbb)
{
  gbb->l_block->getInstList().push_back(llvm::ReturnInst::Create(gbb->l_block->getContext()));
}

void LoopVisitor::visit_impl(GLAMBasicBlock *gbb)
{
  GLAMWorkload *g = gbb->g_wl;
  if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::LOOP_PROLOGUE)
    prologue(gbb);
  else if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::LOOP_EPILOGUE)
    epilogue(gbb);
}

void LoopVisitor::prologue(GLAMBasicBlock *gbb)
{
  GLAMWorkload *g = gbb->g_wl;
  auto get_value = [this,&gbb](uint32_t val)
    {return llvm::ConstantInt::get(llvm::Type::getInt32Ty(gbb->l_block->getContext()),
				   val, false);};
  loop_counter = new llvm::AllocaInst(llvm::IntegerType::get(gbb->l_block->getContext(), 32), "i");
  for(auto i = 0; i < g->loop_logues.size(); i++) {
    if(std::get<0>(g->loop_logues[i]) == gbb->g_vertex) {
      std::get<2>(g->loop_logues[i]) = loop_counter;
    }
  }
    
  llvm::StoreInst* init_loop = new llvm::StoreInst(get_value(0), loop_counter, false);
  gbb->l_block->getInstList().push_back(loop_counter);
  gbb->l_block->getInstList().push_back(init_loop);
}

void LoopVisitor::epilogue(GLAMBasicBlock *gbb)
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

void OperationVisitor::visit_impl(GLAMBasicBlock *gbb)
{
  /* TODO: a get DotVertex function to get rid of the glam_graph derefs */
  GLAMWorkload *g = gbb->g_wl;
  if((*g->glam_graph)[gbb->g_vertex].type == DotVertex::VertexTypes::REGULAR) {
    std::string operation = (*g->glam_graph)[gbb->g_vertex].operation;
    std::string specstr =(*g->glam_graph)[gbb->g_vertex].dataType +
      operation;
    /* TODO: use a container for the binary operations that will be added */
    if(operation == "add") {
      SpecificationToLLVMBinaryOpIterator llvmop_iter = SpecificationToLLVMInstruction.find(specstr);
      llvm::Instruction::BinaryOps bop = (llvmop_iter->second);
      binary(gbb, bop);
    } else if(operation == "load") {
      memory(gbb, llvm::Instruction::Load);
    }
  }
}

OperationVisitor::~OperationVisitor()
{

}

/* TODO: Convert DotVertex operation to BinaryOps at initialization */

void OperationVisitor::binary(GLAMBasicBlock *gbb,
			      llvm::Instruction::BinaryOps op)
{
  GLAMWorkload *g = gbb->g_wl;
  unsigned distance = (*g->glam_graph)[gbb->g_vertex].distance;
  unsigned length = (*g->glam_graph)[gbb->g_vertex].length;
  unsigned itercount = std::ceil(length/distance);
  boost::circular_buffer<llvm::BinaryOperator *> cb(distance);
  std::srand(std::time(0));

  // generate random values with generate_loaded_constant()
  // generate a block of independent operations equal to the instruction dependency distance
  for(unsigned i = 0; i < itercount; i++) {
    for(unsigned j = 0; j < distance; j++) {
      std::vector<llvm::Value *> values;
      for(unsigned k = 0; k < 2; k++) {
	values.push_back(generate_loaded_constant(((*g->glam_graph)[gbb->g_vertex].dataType),
							  0x100));
      }
      llvm::BinaryOperator* bop_result = llvm::BinaryOperator::Create(op, values[0], values[1],"");
      cb.push_back(bop_result);
      gbb->l_block->getInstList().push_back(bop_result);
    }
  }
}

/* TODO: assuming that the block is in a loop and the operation is always using the loop counter
   Assumptions made in this function that should later be fixed:
   1) That the vertex is contained within the loop_logue[0]
   2) The increment is based on loop counter
   3) A mask value is provided
*/

void OperationVisitor::memory(GLAMBasicBlock *gbb,
			      llvm::Instruction::MemoryOps op)
{
  std::string str = (*gbb->g_wl->glam_graph)[gbb->g_vertex].dataType;
  llvm::Type* input_type = gbb->g_wl->ConvertToLLVMType(str);
  auto get_int_value = [this,&gbb](uint32_t val)
    {return llvm::ConstantInt::get(llvm::Type::getInt32Ty(gbb->l_block->getContext()),
				   val, false);};
  GLAMWorkload *g = gbb->g_wl;
  unsigned mask = (*g->glam_graph)[gbb->g_vertex].mask;
  unsigned length = (*g->glam_graph)[gbb->g_vertex].length;
  unsigned stride = (*g->glam_graph)[gbb->g_vertex].stride;
  llvm::Value* loop_counter = std::get<2>(g->loop_logues[0]);
  llvm::LoadInst* loaded_loop_counter = new llvm::LoadInst(loop_counter, "", false);
  // mask the loop_counter*stride with the area required
  llvm::Function::arg_iterator args = g->g_function->l_function->arg_begin();
  llvm::Value* f_input = NULL;
  f_input = &(*args);

  //  llvm::AllocaInst* f_input = new llvm::AllocaInst(input_type, "");
  //  gbb->l_block->getInstList().push_back(loop_counter);
  gbb->l_block->getInstList().push_back(loaded_loop_counter);
  llvm::BinaryOperator* increment = llvm::BinaryOperator::Create(llvm::Instruction::Mul,
								 loaded_loop_counter,
								 generate_loaded_constant("int32", stride*length),
								 "");
  gbb->l_block->getInstList().push_back(increment);
  for(unsigned i = 0; i < length; i++) {
    llvm::BinaryOperator* address = llvm::BinaryOperator::Create(llvm::Instruction::Add,
							increment,
							get_int_value(i*stride));
    llvm::GetElementPtrInst* ptr_1 = llvm::GetElementPtrInst::Create(input_type, f_input, address);
    llvm::LoadInst* float_1 = new llvm::LoadInst(ptr_1, "", true);
    gbb->l_block->getInstList().push_back(address);
    gbb->l_block->getInstList().push_back(ptr_1);
    gbb->l_block->getInstList().push_back(float_1);

  }
}
