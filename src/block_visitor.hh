#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
#include <unordered_map>
#include <utility>

class GLAMBasicBlock;
class GLAMWorkload;

class BlockVisitor
{
public:
  GLAMBasicBlock *g_block;
  BlockVisitor(){}
  ~BlockVisitor(){}
  virtual void visit(GLAMBasicBlock *gbb) {g_block = gbb; visit_impl(gbb);};
  virtual void visit_impl(GLAMBasicBlock *gbb) = 0;
  template <typename T> llvm::Value *generate_loaded_constant(std::string str, T value);
};

class BranchVisitor : public BlockVisitor
{
public:
  BranchVisitor(){}
  ~BranchVisitor(){}
  using BlockVisitor::BlockVisitor;
  void visit_impl(GLAMBasicBlock *gbb);
  void unconditional_branch(GLAMBasicBlock *source, GLAMBasicBlock *target);
  void conditional_branch(GLAMBasicBlock *source, std::vector<GLAMBasicBlock *> targets);
};

class EntryExitVisitor : public BlockVisitor
{
public:
  EntryExitVisitor(){}
  ~EntryExitVisitor(){}
  using BlockVisitor::BlockVisitor;
  void visit_impl(GLAMBasicBlock *gbb);
  void entry(GLAMBasicBlock *gbb);
  void exit(GLAMBasicBlock *gbb);
};

class LoopVisitor : public BlockVisitor
{
  llvm::AllocaInst* loop_counter;
public:
  LoopVisitor(){}
  ~LoopVisitor(){}
  using BlockVisitor::BlockVisitor;
  void visit_impl(GLAMBasicBlock *gbb);
  void prologue(GLAMBasicBlock *gbb);
  void epilogue(GLAMBasicBlock *gbb);
};

class OperationVisitor : public BlockVisitor
{
public:
  
  typedef std::unordered_map<std::string,
			     llvm::Instruction::BinaryOps
			     >::const_iterator SpecificationToLLVMBinaryOpIterator;

  /* TODO: this is a bit of a lame way to do this */

  /* TODO: this introduces a leak 
     ==23256==    by 0x43CFC3: std::_Hashtable<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >, std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, llvm::Instruction::BinaryOps>, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, llvm::Instruction::BinaryOps> >, std::__detail::_Select1st, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > >, std::__detail::_Mod_range_hashing, std::__detail::_Default_ranged_hash, std::__detail::_Prime_rehash_policy, std::__detail::_Hashtable_traits<true, false, true> >::_Hashtable<std::_Deque_iterator<std::pair<char const*, llvm::Instruction::BinaryOps>, std::pair<char const*, llvm::Instruction::BinaryOps>&, std::pair<char const*, llvm::Instruction::BinaryOps>*> >(std::_Deque_iterator<std::pair<char const*, llvm::Instruction::BinaryOps>, std::pair<char const*, llvm::Instruction::BinaryOps>&, std::pair<char const*, llvm::Instruction::BinaryOps>*>, std::_Deque_iterator<std::pair<char const*, llvm::Instruction::BinaryOps>, std::pair<char const*, llvm::Instruction::BinaryOps>&, std::pair<char const*, llvm::Instruction::BinaryOps>*>, unsigned long, std::hash<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&, std::equal_to<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > > const&, std::allocator<std::pair<std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const, llvm::Instruction::BinaryOps> > const&) (hashtable.h:437)*/
  const std::unordered_map<std::string,
			   llvm::Instruction::BinaryOps>
  SpecificationToLLVMInstruction = boost::assign::map_list_of
    ("intadd", llvm::Instruction::Add)
    ("int32add", llvm::Instruction::Add)
    ("int64add", llvm::Instruction::Add)
    ("floatadd", llvm::Instruction::FAdd)
    ("doubleadd", llvm::Instruction::FAdd)
    ;
  


    
  OperationVisitor(){}
  ~OperationVisitor();
  using BlockVisitor::BlockVisitor;
  void visit_impl(GLAMBasicBlock *gbb);
  void binary(GLAMBasicBlock *gbb, llvm::Instruction::BinaryOps op);
  void memory(GLAMBasicBlock *gbb, llvm::Instruction::MemoryOps op);
};
