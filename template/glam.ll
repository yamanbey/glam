; ModuleID = 'glamtest'

define void @glamtest(double addrspace(4065376)*) {
entry:
  %1 = alloca double addrspace(4065376)*
  %2 = alloca double
  %3 = alloca double
  store double addrspace(4065376)* %0, double addrspace(4065376)** %1
  %4 = getelementptr double addrspace(4065376)*, double addrspace(4065376)** %1, i32 8
  %5 = getelementptr double addrspace(4065376)*, double addrspace(4065376)** %1, i32 16
  %6 = load double addrspace(4065376)*, double addrspace(4065376)** %4
  %7 = load double addrspace(4065376)*, double addrspace(4065376)** %5
  br label %loop_prologue

Compute:                                          ; preds = %loop_epilogue, %loop_prologue
  %8 = alloca double
  store double 0x41DC011F51400000, double* %8
  %9 = load double, double* %8
  %10 = alloca double
  store double 0x41C39DD3E6000000, double* %10
  %11 = load double, double* %10
  %12 = fadd double %9, %11
  %13 = alloca double
  store double 0x41D12084A5400000, double* %13
  %14 = load double, double* %13
  %15 = alloca double
  store double 0x41C080B737800000, double* %15
  %16 = load double, double* %15
  %17 = fadd double %14, %16
  %18 = alloca double
  store double 0x41C809C859800000, double* %18
  %19 = load double, double* %18
  %20 = alloca double
  store double 0x41BF349A04000000, double* %20
  %21 = load double, double* %20
  %22 = fadd double %19, %21
  %23 = alloca double
  store double 0x41D89AC277C00000, double* %23
  %24 = load double, double* %23
  %25 = alloca double
  store double 0x41B67023D2000000, double* %25
  %26 = load double, double* %25
  %27 = fadd double %24, %26
  %28 = alloca double
  store double 0x41D87F12B7400000, double* %28
  %29 = load double, double* %28
  %30 = alloca double
  store double 0x41C38C772B000000, double* %30
  %31 = load double, double* %30
  %32 = fadd double %29, %31
  %33 = alloca double
  store double 0x41DEE533A8C00000, double* %33
  %34 = load double, double* %33
  %35 = alloca double
  store double 0x41D44CBB73800000, double* %35
  %36 = load double, double* %35
  %37 = fadd double %34, %36
  %38 = alloca double
  store double 0x41DD9E0C3E400000, double* %38
  %39 = load double, double* %38
  %40 = alloca double
  store double 0x41C41B77CB800000, double* %40
  %41 = load double, double* %40
  %42 = fadd double %39, %41
  %43 = alloca double
  store double 0x41C568C26B000000, double* %43
  %44 = load double, double* %43
  %45 = alloca double
  store double 0x41D66AD47C400000, double* %45
  %46 = load double, double* %45
  %47 = fadd double %44, %46
  br label %Memory

Memory:                                           ; preds = %Compute
  %48 = alloca double
  %49 = getelementptr double, double* %48, i32 0
  %50 = load volatile double, double* %49
  %51 = getelementptr double, double* %48, i32 8
  %52 = load volatile double, double* %51
  %53 = getelementptr double, double* %48, i32 16
  %54 = load volatile double, double* %53
  %55 = getelementptr double, double* %48, i32 24
  %56 = load volatile double, double* %55
  br label %loop_epilogue

exit:                                             ; preds = %loop_epilogue
  ret void

loop_prologue:                                    ; preds = %entry
  %i = alloca i32
  store i32 0, i32* %i
  br label %Compute

loop_epilogue:                                    ; preds = %Memory
  %57 = load i32, i32* %i
  %58 = add i32 %57, 1
  store i32 %58, i32* %i
  %59 = load i32, i32* %i
  %60 = icmp ult i32 %59, 10000000000
  br i1 %60, label %Compute, label %exit
}
