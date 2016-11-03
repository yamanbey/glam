; ModuleID = 'glamtest'

define void @glamtest(i64 addrspace(3885216)*) {
entry:
  %1 = alloca i64 addrspace(3885216)*
  %2 = alloca i64
  %3 = alloca i64
  store i64 addrspace(3885216)* %0, i64 addrspace(3885216)** %1
  %4 = getelementptr i64 addrspace(3885216)*, i64 addrspace(3885216)** %1, i32 8
  %5 = getelementptr i64 addrspace(3885216)*, i64 addrspace(3885216)** %1, i32 16
  %6 = load i64 addrspace(3885216)*, i64 addrspace(3885216)** %4
  %7 = load i64 addrspace(3885216)*, i64 addrspace(3885216)** %5
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
  %18 = alloca i64
  store i64 256, i64* %18
  %19 = load i64, i64* %18
  %20 = alloca i64
  store i64 256, i64* %20
  %21 = load i64, i64* %20
  %22 = add i64 %19, %21
  %23 = alloca i64
  store i64 256, i64* %23
  %24 = load i64, i64* %23
  %25 = alloca i64
  store i64 256, i64* %25
  %26 = load i64, i64* %25
  %27 = add i64 %24, %26
  br label %Memory

Memory:                                           ; preds = %Compute
  %28 = load i32, i32* %i
  %29 = alloca i32
  store i32 256, i32* %29
  %30 = load i32, i32* %29
  %31 = mul i32 %28, %30
  %32 = add i32 %31, 0
  %33 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %32
  %34 = load volatile i64, i64 addrspace(3885216)* %33
  %35 = add i32 %31, 8
  %36 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %35
  %37 = load volatile i64, i64 addrspace(3885216)* %36
  %38 = add i32 %31, 16
  %39 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %38
  %40 = load volatile i64, i64 addrspace(3885216)* %39
  %41 = add i32 %31, 24
  %42 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %41
  %43 = load volatile i64, i64 addrspace(3885216)* %42
  %44 = add i32 %31, 32
  %45 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %44
  %46 = load volatile i64, i64 addrspace(3885216)* %45
  %47 = add i32 %31, 40
  %48 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %47
  %49 = load volatile i64, i64 addrspace(3885216)* %48
  %50 = add i32 %31, 48
  %51 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %50
  %52 = load volatile i64, i64 addrspace(3885216)* %51
  %53 = add i32 %31, 56
  %54 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %53
  %55 = load volatile i64, i64 addrspace(3885216)* %54
  %56 = add i32 %31, 64
  %57 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %56
  %58 = load volatile i64, i64 addrspace(3885216)* %57
  %59 = add i32 %31, 72
  %60 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %59
  %61 = load volatile i64, i64 addrspace(3885216)* %60
  %62 = add i32 %31, 80
  %63 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %62
  %64 = load volatile i64, i64 addrspace(3885216)* %63
  %65 = add i32 %31, 88
  %66 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %65
  %67 = load volatile i64, i64 addrspace(3885216)* %66
  %68 = add i32 %31, 96
  %69 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %68
  %70 = load volatile i64, i64 addrspace(3885216)* %69
  %71 = add i32 %31, 104
  %72 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %71
  %73 = load volatile i64, i64 addrspace(3885216)* %72
  %74 = add i32 %31, 112
  %75 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %74
  %76 = load volatile i64, i64 addrspace(3885216)* %75
  %77 = add i32 %31, 120
  %78 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %77
  %79 = load volatile i64, i64 addrspace(3885216)* %78
  %80 = add i32 %31, 128
  %81 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %80
  %82 = load volatile i64, i64 addrspace(3885216)* %81
  %83 = add i32 %31, 136
  %84 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %83
  %85 = load volatile i64, i64 addrspace(3885216)* %84
  %86 = add i32 %31, 144
  %87 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %86
  %88 = load volatile i64, i64 addrspace(3885216)* %87
  %89 = add i32 %31, 152
  %90 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %89
  %91 = load volatile i64, i64 addrspace(3885216)* %90
  %92 = add i32 %31, 160
  %93 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %92
  %94 = load volatile i64, i64 addrspace(3885216)* %93
  %95 = add i32 %31, 168
  %96 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %95
  %97 = load volatile i64, i64 addrspace(3885216)* %96
  %98 = add i32 %31, 176
  %99 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %98
  %100 = load volatile i64, i64 addrspace(3885216)* %99
  %101 = add i32 %31, 184
  %102 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %101
  %103 = load volatile i64, i64 addrspace(3885216)* %102
  %104 = add i32 %31, 192
  %105 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %104
  %106 = load volatile i64, i64 addrspace(3885216)* %105
  %107 = add i32 %31, 200
  %108 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %107
  %109 = load volatile i64, i64 addrspace(3885216)* %108
  %110 = add i32 %31, 208
  %111 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %110
  %112 = load volatile i64, i64 addrspace(3885216)* %111
  %113 = add i32 %31, 216
  %114 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %113
  %115 = load volatile i64, i64 addrspace(3885216)* %114
  %116 = add i32 %31, 224
  %117 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %116
  %118 = load volatile i64, i64 addrspace(3885216)* %117
  %119 = add i32 %31, 232
  %120 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %119
  %121 = load volatile i64, i64 addrspace(3885216)* %120
  %122 = add i32 %31, 240
  %123 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %122
  %124 = load volatile i64, i64 addrspace(3885216)* %123
  %125 = add i32 %31, 248
  %126 = getelementptr i64, i64 addrspace(3885216)* %0, i32 %125
  %127 = load volatile i64, i64 addrspace(3885216)* %126
  br label %loop_epilogue

exit:                                             ; preds = %loop_epilogue
  ret void

loop_prologue:                                    ; preds = %entry
  %i = alloca i32
  store i32 0, i32* %i
  br label %Compute

loop_epilogue:                                    ; preds = %Memory
  %128 = load i32, i32* %i
  %129 = add i32 %128, 1
  store i32 %129, i32* %i
  %130 = load i32, i32* %i
  %131 = icmp ult i32 %130, 500000
  br i1 %131, label %Compute, label %exit
}
