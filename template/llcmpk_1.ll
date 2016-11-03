; ModuleID = 'glamtest'

define void @glamtest(i64 addrspace(6760608)*) {
entry:
  %1 = alloca i64 addrspace(6760608)*
  %2 = alloca i64
  %3 = alloca i64
  store i64 addrspace(6760608)* %0, i64 addrspace(6760608)** %1
  %4 = getelementptr i64 addrspace(6760608)*, i64 addrspace(6760608)** %1, i32 8
  %5 = getelementptr i64 addrspace(6760608)*, i64 addrspace(6760608)** %1, i32 16
  %6 = load i64 addrspace(6760608)*, i64 addrspace(6760608)** %4
  %7 = load i64 addrspace(6760608)*, i64 addrspace(6760608)** %5
  br label %loop_prologue

Compute:                                          ; preds = %loop_epilogue, %loop_prologue
  %8 = alloca i64
  store i64 256, i64* %8
  %9 = load i64, i64* %8
  %10 = alloca i64
  store i64 256, i64* %10
  %11 = load i64, i64* %10
  %12 = add i64 %9, %11
  %13 = alloca i64
  store i64 256, i64* %13
  %14 = load i64, i64* %13
  %15 = alloca i64
  store i64 256, i64* %15
  %16 = load i64, i64* %15
  %17 = add i64 %14, %16
  br label %Memory

Memory:                                           ; preds = %Compute
  %18 = load i32, i32* %i
  %19 = alloca i32
  store i32 4, i32* %19
  %20 = load i32, i32* %19
  %21 = mul i32 %18, %20
  %22 = add i32 %21, 0
  %23 = getelementptr i64, i64 addrspace(6760608)* %0, i32 %22
  %24 = load volatile i64, i64 addrspace(6760608)* %23
  br label %loop_epilogue

exit:                                             ; preds = %loop_epilogue
  ret void

loop_prologue:                                    ; preds = %entry
  %i = alloca i32
  store i32 0, i32* %i
  br label %Compute

loop_epilogue:                                    ; preds = %Memory
  %25 = load i32, i32* %i
  %26 = add i32 %25, 1
  store i32 %26, i32* %i
  %27 = load i32, i32* %i
  %28 = icmp ult i32 %27, 500000
  br i1 %28, label %Compute, label %exit
}
