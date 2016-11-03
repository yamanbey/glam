; ModuleID = 'add_test'

define void @add_test(i64 addrspace(3237536)*) {
entry:
  %1 = alloca i64 addrspace(3237536)*
  %2 = alloca i64
  %3 = alloca i64
  store i64 addrspace(3237536)* %0, i64 addrspace(3237536)** %1
  %4 = getelementptr i64 addrspace(3237536)*, i64 addrspace(3237536)** %1, i32 8
  %5 = getelementptr i64 addrspace(3237536)*, i64 addrspace(3237536)** %1, i32 16
  %6 = load i64 addrspace(3237536)*, i64 addrspace(3237536)** %4
  %7 = load i64 addrspace(3237536)*, i64 addrspace(3237536)** %5
  br label %loop_prologue

Memory:                                           ; preds = %loop_epilogue, %loop_prologue
  %8 = load i32, i32* %i
  %9 = alloca i32
  store i32 0, i32* %9
  %10 = load i32, i32* %9
  %11 = mul i32 %8, %10
  %12 = add i32 %11, 0
  %13 = getelementptr i64, i64 addrspace(3237536)* %0, i32 %12
  %14 = load volatile i64, i64 addrspace(3237536)* %13
  %15 = add i32 %11, 0
  %16 = getelementptr i64, i64 addrspace(3237536)* %0, i32 %15
  %17 = load volatile i64, i64 addrspace(3237536)* %16
  %18 = add i32 %11, 0
  %19 = getelementptr i64, i64 addrspace(3237536)* %0, i32 %18
  %20 = load volatile i64, i64 addrspace(3237536)* %19
  %21 = add i32 %11, 0
  %22 = getelementptr i64, i64 addrspace(3237536)* %0, i32 %21
  %23 = load volatile i64, i64 addrspace(3237536)* %22
  br label %loop_epilogue

exit:                                             ; preds = %loop_epilogue
  ret void

loop_prologue:                                    ; preds = %entry
  %i = alloca i32
  store i32 0, i32* %i
  br label %Memory

loop_epilogue:                                    ; preds = %Memory
  %24 = load i32, i32* %i
  %25 = add i32 %24, 1
  store i32 %25, i32* %i
  %26 = load i32, i32* %i
  %27 = icmp ult i32 %26, 500000
  br i1 %27, label %Memory, label %exit
}
