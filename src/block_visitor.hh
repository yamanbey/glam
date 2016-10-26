#include <llvm/IR/Constants.h>
#include <llvm/IR/Instructions.h>
class GLAMBasicBlock;
class GLAMWorkload;

class BlockVisitor
{
public:
  BlockVisitor(){}
  ~BlockVisitor(){}
  virtual void visit(GLAMBasicBlock *gbb, GLAMWorkload *go) = 0;
};

class BranchVisitor : public BlockVisitor
{
public:
  BranchVisitor(){}
  ~BranchVisitor(){}
  void visit(GLAMBasicBlock *gbb, GLAMWorkload *g);
  void unconditional_branch(GLAMBasicBlock *s, GLAMBasicBlock *t);
  void conditional_branch(GLAMBasicBlock *s, std::vector<GLAMBasicBlock *> t, GLAMWorkload *g);
};

class EntryExitVisitor : public BlockVisitor
{
public:
  EntryExitVisitor(){}
  ~EntryExitVisitor(){}
  void visit(GLAMBasicBlock *gbb, GLAMWorkload *g);
  void entry(GLAMBasicBlock *gbb, GLAMWorkload *g);
  void exit(GLAMBasicBlock *gbb, GLAMWorkload *g);
};

class LoopVisitor : public BlockVisitor
{
  llvm::AllocaInst* loop_counter;
public:
  LoopVisitor(){}
  ~LoopVisitor(){}
  void visit(GLAMBasicBlock *gbb, GLAMWorkload *go);
  void prologue(GLAMBasicBlock *gbb, GLAMWorkload *go);
  void epilogue(GLAMBasicBlock *gbb, GLAMWorkload *go);
};

