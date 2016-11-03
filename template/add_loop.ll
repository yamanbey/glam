; ModuleID = 'add_test'

define void @add_test(float addrspace(7644640)*) {
entry:
  %1 = alloca float addrspace(7644640)*
  %2 = alloca float
  %3 = alloca float
  store float addrspace(7644640)* %0, float addrspace(7644640)** %1
  %4 = getelementptr float addrspace(7644640)*, float addrspace(7644640)** %1, i32 8
  %5 = getelementptr float addrspace(7644640)*, float addrspace(7644640)** %1, i32 16
  %6 = load float addrspace(7644640)*, float addrspace(7644640)** %4
  %7 = load float addrspace(7644640)*, float addrspace(7644640)** %5
  br label %loop_prologue

Compute:                                          ; preds = %loop_epilogue, %loop_prologue
  %8 = alloca float
  store float 2.560000e+02, float* %8
  %9 = load float, float* %8
  %10 = alloca float
  store float 2.560000e+02, float* %10
  %11 = load float, float* %10
  %12 = fadd float %9, %11
  %13 = alloca float
  store float 2.560000e+02, float* %13
  %14 = load float, float* %13
  %15 = alloca float
  store float 2.560000e+02, float* %15
  %16 = load float, float* %15
  %17 = fadd float %14, %16
  %18 = alloca float
  store float 2.560000e+02, float* %18
  %19 = load float, float* %18
  %20 = alloca float
  store float 2.560000e+02, float* %20
  %21 = load float, float* %20
  %22 = fadd float %19, %21
  %23 = alloca float
  store float 2.560000e+02, float* %23
  %24 = load float, float* %23
  %25 = alloca float
  store float 2.560000e+02, float* %25
  %26 = load float, float* %25
  %27 = fadd float %24, %26
  %28 = alloca float
  store float 2.560000e+02, float* %28
  %29 = load float, float* %28
  %30 = alloca float
  store float 2.560000e+02, float* %30
  %31 = load float, float* %30
  %32 = fadd float %29, %31
  %33 = alloca float
  store float 2.560000e+02, float* %33
  %34 = load float, float* %33
  %35 = alloca float
  store float 2.560000e+02, float* %35
  %36 = load float, float* %35
  %37 = fadd float %34, %36
  %38 = alloca float
  store float 2.560000e+02, float* %38
  %39 = load float, float* %38
  %40 = alloca float
  store float 2.560000e+02, float* %40
  %41 = load float, float* %40
  %42 = fadd float %39, %41
  %43 = alloca float
  store float 2.560000e+02, float* %43
  %44 = load float, float* %43
  %45 = alloca float
  store float 2.560000e+02, float* %45
  %46 = load float, float* %45
  %47 = fadd float %44, %46
  %48 = alloca float
  store float 2.560000e+02, float* %48
  %49 = load float, float* %48
  %50 = alloca float
  store float 2.560000e+02, float* %50
  %51 = load float, float* %50
  %52 = fadd float %49, %51
  %53 = alloca float
  store float 2.560000e+02, float* %53
  %54 = load float, float* %53
  %55 = alloca float
  store float 2.560000e+02, float* %55
  %56 = load float, float* %55
  %57 = fadd float %54, %56
  %58 = alloca float
  store float 2.560000e+02, float* %58
  %59 = load float, float* %58
  %60 = alloca float
  store float 2.560000e+02, float* %60
  %61 = load float, float* %60
  %62 = fadd float %59, %61
  %63 = alloca float
  store float 2.560000e+02, float* %63
  %64 = load float, float* %63
  %65 = alloca float
  store float 2.560000e+02, float* %65
  %66 = load float, float* %65
  %67 = fadd float %64, %66
  %68 = alloca float
  store float 2.560000e+02, float* %68
  %69 = load float, float* %68
  %70 = alloca float
  store float 2.560000e+02, float* %70
  %71 = load float, float* %70
  %72 = fadd float %69, %71
  %73 = alloca float
  store float 2.560000e+02, float* %73
  %74 = load float, float* %73
  %75 = alloca float
  store float 2.560000e+02, float* %75
  %76 = load float, float* %75
  %77 = fadd float %74, %76
  %78 = alloca float
  store float 2.560000e+02, float* %78
  %79 = load float, float* %78
  %80 = alloca float
  store float 2.560000e+02, float* %80
  %81 = load float, float* %80
  %82 = fadd float %79, %81
  %83 = alloca float
  store float 2.560000e+02, float* %83
  %84 = load float, float* %83
  %85 = alloca float
  store float 2.560000e+02, float* %85
  %86 = load float, float* %85
  %87 = fadd float %84, %86
  %88 = alloca float
  store float 2.560000e+02, float* %88
  %89 = load float, float* %88
  %90 = alloca float
  store float 2.560000e+02, float* %90
  %91 = load float, float* %90
  %92 = fadd float %89, %91
  %93 = alloca float
  store float 2.560000e+02, float* %93
  %94 = load float, float* %93
  %95 = alloca float
  store float 2.560000e+02, float* %95
  %96 = load float, float* %95
  %97 = fadd float %94, %96
  %98 = alloca float
  store float 2.560000e+02, float* %98
  %99 = load float, float* %98
  %100 = alloca float
  store float 2.560000e+02, float* %100
  %101 = load float, float* %100
  %102 = fadd float %99, %101
  %103 = alloca float
  store float 2.560000e+02, float* %103
  %104 = load float, float* %103
  %105 = alloca float
  store float 2.560000e+02, float* %105
  %106 = load float, float* %105
  %107 = fadd float %104, %106
  %108 = alloca float
  store float 2.560000e+02, float* %108
  %109 = load float, float* %108
  %110 = alloca float
  store float 2.560000e+02, float* %110
  %111 = load float, float* %110
  %112 = fadd float %109, %111
  %113 = alloca float
  store float 2.560000e+02, float* %113
  %114 = load float, float* %113
  %115 = alloca float
  store float 2.560000e+02, float* %115
  %116 = load float, float* %115
  %117 = fadd float %114, %116
  %118 = alloca float
  store float 2.560000e+02, float* %118
  %119 = load float, float* %118
  %120 = alloca float
  store float 2.560000e+02, float* %120
  %121 = load float, float* %120
  %122 = fadd float %119, %121
  %123 = alloca float
  store float 2.560000e+02, float* %123
  %124 = load float, float* %123
  %125 = alloca float
  store float 2.560000e+02, float* %125
  %126 = load float, float* %125
  %127 = fadd float %124, %126
  %128 = alloca float
  store float 2.560000e+02, float* %128
  %129 = load float, float* %128
  %130 = alloca float
  store float 2.560000e+02, float* %130
  %131 = load float, float* %130
  %132 = fadd float %129, %131
  %133 = alloca float
  store float 2.560000e+02, float* %133
  %134 = load float, float* %133
  %135 = alloca float
  store float 2.560000e+02, float* %135
  %136 = load float, float* %135
  %137 = fadd float %134, %136
  %138 = alloca float
  store float 2.560000e+02, float* %138
  %139 = load float, float* %138
  %140 = alloca float
  store float 2.560000e+02, float* %140
  %141 = load float, float* %140
  %142 = fadd float %139, %141
  %143 = alloca float
  store float 2.560000e+02, float* %143
  %144 = load float, float* %143
  %145 = alloca float
  store float 2.560000e+02, float* %145
  %146 = load float, float* %145
  %147 = fadd float %144, %146
  %148 = alloca float
  store float 2.560000e+02, float* %148
  %149 = load float, float* %148
  %150 = alloca float
  store float 2.560000e+02, float* %150
  %151 = load float, float* %150
  %152 = fadd float %149, %151
  %153 = alloca float
  store float 2.560000e+02, float* %153
  %154 = load float, float* %153
  %155 = alloca float
  store float 2.560000e+02, float* %155
  %156 = load float, float* %155
  %157 = fadd float %154, %156
  %158 = alloca float
  store float 2.560000e+02, float* %158
  %159 = load float, float* %158
  %160 = alloca float
  store float 2.560000e+02, float* %160
  %161 = load float, float* %160
  %162 = fadd float %159, %161
  %163 = alloca float
  store float 2.560000e+02, float* %163
  %164 = load float, float* %163
  %165 = alloca float
  store float 2.560000e+02, float* %165
  %166 = load float, float* %165
  %167 = fadd float %164, %166
  br label %loop_epilogue

exit:                                             ; preds = %loop_epilogue
  ret void

loop_prologue:                                    ; preds = %entry
  %i = alloca i32
  store i32 0, i32* %i
  br label %Compute

loop_epilogue:                                    ; preds = %Compute
  %168 = load i32, i32* %i
  %169 = add i32 %168, 1
  store i32 %169, i32* %i
  %170 = load i32, i32* %i
  %171 = icmp ult i32 %170, 5000000
  br i1 %171, label %Compute, label %exit
}
