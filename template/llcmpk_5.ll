; ModuleID = 'glamtest'

define void @glamtest(i64 addrspace(15829152)*) {
entry:
  %1 = alloca i64 addrspace(15829152)*
  %2 = alloca i64
  %3 = alloca i64
  store i64 addrspace(15829152)* %0, i64 addrspace(15829152)** %1
  %4 = getelementptr i64 addrspace(15829152)*, i64 addrspace(15829152)** %1, i32 8
  %5 = getelementptr i64 addrspace(15829152)*, i64 addrspace(15829152)** %1, i32 16
  %6 = load i64 addrspace(15829152)*, i64 addrspace(15829152)** %4
  %7 = load i64 addrspace(15829152)*, i64 addrspace(15829152)** %5
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
  %28 = alloca i64
  store i64 256, i64* %28
  %29 = load i64, i64* %28
  %30 = alloca i64
  store i64 256, i64* %30
  %31 = load i64, i64* %30
  %32 = add i64 %29, %31
  %33 = alloca i64
  store i64 256, i64* %33
  %34 = load i64, i64* %33
  %35 = alloca i64
  store i64 256, i64* %35
  %36 = load i64, i64* %35
  %37 = add i64 %34, %36
  %38 = alloca i64
  store i64 256, i64* %38
  %39 = load i64, i64* %38
  %40 = alloca i64
  store i64 256, i64* %40
  %41 = load i64, i64* %40
  %42 = add i64 %39, %41
  %43 = alloca i64
  store i64 256, i64* %43
  %44 = load i64, i64* %43
  %45 = alloca i64
  store i64 256, i64* %45
  %46 = load i64, i64* %45
  %47 = add i64 %44, %46
  %48 = alloca i64
  store i64 256, i64* %48
  %49 = load i64, i64* %48
  %50 = alloca i64
  store i64 256, i64* %50
  %51 = load i64, i64* %50
  %52 = add i64 %49, %51
  %53 = alloca i64
  store i64 256, i64* %53
  %54 = load i64, i64* %53
  %55 = alloca i64
  store i64 256, i64* %55
  %56 = load i64, i64* %55
  %57 = add i64 %54, %56
  %58 = alloca i64
  store i64 256, i64* %58
  %59 = load i64, i64* %58
  %60 = alloca i64
  store i64 256, i64* %60
  %61 = load i64, i64* %60
  %62 = add i64 %59, %61
  %63 = alloca i64
  store i64 256, i64* %63
  %64 = load i64, i64* %63
  %65 = alloca i64
  store i64 256, i64* %65
  %66 = load i64, i64* %65
  %67 = add i64 %64, %66
  %68 = alloca i64
  store i64 256, i64* %68
  %69 = load i64, i64* %68
  %70 = alloca i64
  store i64 256, i64* %70
  %71 = load i64, i64* %70
  %72 = add i64 %69, %71
  %73 = alloca i64
  store i64 256, i64* %73
  %74 = load i64, i64* %73
  %75 = alloca i64
  store i64 256, i64* %75
  %76 = load i64, i64* %75
  %77 = add i64 %74, %76
  %78 = alloca i64
  store i64 256, i64* %78
  %79 = load i64, i64* %78
  %80 = alloca i64
  store i64 256, i64* %80
  %81 = load i64, i64* %80
  %82 = add i64 %79, %81
  %83 = alloca i64
  store i64 256, i64* %83
  %84 = load i64, i64* %83
  %85 = alloca i64
  store i64 256, i64* %85
  %86 = load i64, i64* %85
  %87 = add i64 %84, %86
  %88 = alloca i64
  store i64 256, i64* %88
  %89 = load i64, i64* %88
  %90 = alloca i64
  store i64 256, i64* %90
  %91 = load i64, i64* %90
  %92 = add i64 %89, %91
  %93 = alloca i64
  store i64 256, i64* %93
  %94 = load i64, i64* %93
  %95 = alloca i64
  store i64 256, i64* %95
  %96 = load i64, i64* %95
  %97 = add i64 %94, %96
  %98 = alloca i64
  store i64 256, i64* %98
  %99 = load i64, i64* %98
  %100 = alloca i64
  store i64 256, i64* %100
  %101 = load i64, i64* %100
  %102 = add i64 %99, %101
  %103 = alloca i64
  store i64 256, i64* %103
  %104 = load i64, i64* %103
  %105 = alloca i64
  store i64 256, i64* %105
  %106 = load i64, i64* %105
  %107 = add i64 %104, %106
  %108 = alloca i64
  store i64 256, i64* %108
  %109 = load i64, i64* %108
  %110 = alloca i64
  store i64 256, i64* %110
  %111 = load i64, i64* %110
  %112 = add i64 %109, %111
  %113 = alloca i64
  store i64 256, i64* %113
  %114 = load i64, i64* %113
  %115 = alloca i64
  store i64 256, i64* %115
  %116 = load i64, i64* %115
  %117 = add i64 %114, %116
  %118 = alloca i64
  store i64 256, i64* %118
  %119 = load i64, i64* %118
  %120 = alloca i64
  store i64 256, i64* %120
  %121 = load i64, i64* %120
  %122 = add i64 %119, %121
  %123 = alloca i64
  store i64 256, i64* %123
  %124 = load i64, i64* %123
  %125 = alloca i64
  store i64 256, i64* %125
  %126 = load i64, i64* %125
  %127 = add i64 %124, %126
  %128 = alloca i64
  store i64 256, i64* %128
  %129 = load i64, i64* %128
  %130 = alloca i64
  store i64 256, i64* %130
  %131 = load i64, i64* %130
  %132 = add i64 %129, %131
  %133 = alloca i64
  store i64 256, i64* %133
  %134 = load i64, i64* %133
  %135 = alloca i64
  store i64 256, i64* %135
  %136 = load i64, i64* %135
  %137 = add i64 %134, %136
  %138 = alloca i64
  store i64 256, i64* %138
  %139 = load i64, i64* %138
  %140 = alloca i64
  store i64 256, i64* %140
  %141 = load i64, i64* %140
  %142 = add i64 %139, %141
  %143 = alloca i64
  store i64 256, i64* %143
  %144 = load i64, i64* %143
  %145 = alloca i64
  store i64 256, i64* %145
  %146 = load i64, i64* %145
  %147 = add i64 %144, %146
  %148 = alloca i64
  store i64 256, i64* %148
  %149 = load i64, i64* %148
  %150 = alloca i64
  store i64 256, i64* %150
  %151 = load i64, i64* %150
  %152 = add i64 %149, %151
  %153 = alloca i64
  store i64 256, i64* %153
  %154 = load i64, i64* %153
  %155 = alloca i64
  store i64 256, i64* %155
  %156 = load i64, i64* %155
  %157 = add i64 %154, %156
  %158 = alloca i64
  store i64 256, i64* %158
  %159 = load i64, i64* %158
  %160 = alloca i64
  store i64 256, i64* %160
  %161 = load i64, i64* %160
  %162 = add i64 %159, %161
  %163 = alloca i64
  store i64 256, i64* %163
  %164 = load i64, i64* %163
  %165 = alloca i64
  store i64 256, i64* %165
  %166 = load i64, i64* %165
  %167 = add i64 %164, %166
  %168 = alloca i64
  store i64 256, i64* %168
  %169 = load i64, i64* %168
  %170 = alloca i64
  store i64 256, i64* %170
  %171 = load i64, i64* %170
  %172 = add i64 %169, %171
  %173 = alloca i64
  store i64 256, i64* %173
  %174 = load i64, i64* %173
  %175 = alloca i64
  store i64 256, i64* %175
  %176 = load i64, i64* %175
  %177 = add i64 %174, %176
  %178 = alloca i64
  store i64 256, i64* %178
  %179 = load i64, i64* %178
  %180 = alloca i64
  store i64 256, i64* %180
  %181 = load i64, i64* %180
  %182 = add i64 %179, %181
  %183 = alloca i64
  store i64 256, i64* %183
  %184 = load i64, i64* %183
  %185 = alloca i64
  store i64 256, i64* %185
  %186 = load i64, i64* %185
  %187 = add i64 %184, %186
  %188 = alloca i64
  store i64 256, i64* %188
  %189 = load i64, i64* %188
  %190 = alloca i64
  store i64 256, i64* %190
  %191 = load i64, i64* %190
  %192 = add i64 %189, %191
  %193 = alloca i64
  store i64 256, i64* %193
  %194 = load i64, i64* %193
  %195 = alloca i64
  store i64 256, i64* %195
  %196 = load i64, i64* %195
  %197 = add i64 %194, %196
  %198 = alloca i64
  store i64 256, i64* %198
  %199 = load i64, i64* %198
  %200 = alloca i64
  store i64 256, i64* %200
  %201 = load i64, i64* %200
  %202 = add i64 %199, %201
  %203 = alloca i64
  store i64 256, i64* %203
  %204 = load i64, i64* %203
  %205 = alloca i64
  store i64 256, i64* %205
  %206 = load i64, i64* %205
  %207 = add i64 %204, %206
  %208 = alloca i64
  store i64 256, i64* %208
  %209 = load i64, i64* %208
  %210 = alloca i64
  store i64 256, i64* %210
  %211 = load i64, i64* %210
  %212 = add i64 %209, %211
  %213 = alloca i64
  store i64 256, i64* %213
  %214 = load i64, i64* %213
  %215 = alloca i64
  store i64 256, i64* %215
  %216 = load i64, i64* %215
  %217 = add i64 %214, %216
  %218 = alloca i64
  store i64 256, i64* %218
  %219 = load i64, i64* %218
  %220 = alloca i64
  store i64 256, i64* %220
  %221 = load i64, i64* %220
  %222 = add i64 %219, %221
  %223 = alloca i64
  store i64 256, i64* %223
  %224 = load i64, i64* %223
  %225 = alloca i64
  store i64 256, i64* %225
  %226 = load i64, i64* %225
  %227 = add i64 %224, %226
  %228 = alloca i64
  store i64 256, i64* %228
  %229 = load i64, i64* %228
  %230 = alloca i64
  store i64 256, i64* %230
  %231 = load i64, i64* %230
  %232 = add i64 %229, %231
  %233 = alloca i64
  store i64 256, i64* %233
  %234 = load i64, i64* %233
  %235 = alloca i64
  store i64 256, i64* %235
  %236 = load i64, i64* %235
  %237 = add i64 %234, %236
  %238 = alloca i64
  store i64 256, i64* %238
  %239 = load i64, i64* %238
  %240 = alloca i64
  store i64 256, i64* %240
  %241 = load i64, i64* %240
  %242 = add i64 %239, %241
  %243 = alloca i64
  store i64 256, i64* %243
  %244 = load i64, i64* %243
  %245 = alloca i64
  store i64 256, i64* %245
  %246 = load i64, i64* %245
  %247 = add i64 %244, %246
  %248 = alloca i64
  store i64 256, i64* %248
  %249 = load i64, i64* %248
  %250 = alloca i64
  store i64 256, i64* %250
  %251 = load i64, i64* %250
  %252 = add i64 %249, %251
  %253 = alloca i64
  store i64 256, i64* %253
  %254 = load i64, i64* %253
  %255 = alloca i64
  store i64 256, i64* %255
  %256 = load i64, i64* %255
  %257 = add i64 %254, %256
  %258 = alloca i64
  store i64 256, i64* %258
  %259 = load i64, i64* %258
  %260 = alloca i64
  store i64 256, i64* %260
  %261 = load i64, i64* %260
  %262 = add i64 %259, %261
  %263 = alloca i64
  store i64 256, i64* %263
  %264 = load i64, i64* %263
  %265 = alloca i64
  store i64 256, i64* %265
  %266 = load i64, i64* %265
  %267 = add i64 %264, %266
  %268 = alloca i64
  store i64 256, i64* %268
  %269 = load i64, i64* %268
  %270 = alloca i64
  store i64 256, i64* %270
  %271 = load i64, i64* %270
  %272 = add i64 %269, %271
  %273 = alloca i64
  store i64 256, i64* %273
  %274 = load i64, i64* %273
  %275 = alloca i64
  store i64 256, i64* %275
  %276 = load i64, i64* %275
  %277 = add i64 %274, %276
  %278 = alloca i64
  store i64 256, i64* %278
  %279 = load i64, i64* %278
  %280 = alloca i64
  store i64 256, i64* %280
  %281 = load i64, i64* %280
  %282 = add i64 %279, %281
  %283 = alloca i64
  store i64 256, i64* %283
  %284 = load i64, i64* %283
  %285 = alloca i64
  store i64 256, i64* %285
  %286 = load i64, i64* %285
  %287 = add i64 %284, %286
  %288 = alloca i64
  store i64 256, i64* %288
  %289 = load i64, i64* %288
  %290 = alloca i64
  store i64 256, i64* %290
  %291 = load i64, i64* %290
  %292 = add i64 %289, %291
  %293 = alloca i64
  store i64 256, i64* %293
  %294 = load i64, i64* %293
  %295 = alloca i64
  store i64 256, i64* %295
  %296 = load i64, i64* %295
  %297 = add i64 %294, %296
  %298 = alloca i64
  store i64 256, i64* %298
  %299 = load i64, i64* %298
  %300 = alloca i64
  store i64 256, i64* %300
  %301 = load i64, i64* %300
  %302 = add i64 %299, %301
  %303 = alloca i64
  store i64 256, i64* %303
  %304 = load i64, i64* %303
  %305 = alloca i64
  store i64 256, i64* %305
  %306 = load i64, i64* %305
  %307 = add i64 %304, %306
  %308 = alloca i64
  store i64 256, i64* %308
  %309 = load i64, i64* %308
  %310 = alloca i64
  store i64 256, i64* %310
  %311 = load i64, i64* %310
  %312 = add i64 %309, %311
  %313 = alloca i64
  store i64 256, i64* %313
  %314 = load i64, i64* %313
  %315 = alloca i64
  store i64 256, i64* %315
  %316 = load i64, i64* %315
  %317 = add i64 %314, %316
  %318 = alloca i64
  store i64 256, i64* %318
  %319 = load i64, i64* %318
  %320 = alloca i64
  store i64 256, i64* %320
  %321 = load i64, i64* %320
  %322 = add i64 %319, %321
  %323 = alloca i64
  store i64 256, i64* %323
  %324 = load i64, i64* %323
  %325 = alloca i64
  store i64 256, i64* %325
  %326 = load i64, i64* %325
  %327 = add i64 %324, %326
  br label %Memory

Memory:                                           ; preds = %Compute
  %328 = load i32, i32* %i
  %329 = alloca i32
  store i32 128, i32* %329
  %330 = load i32, i32* %329
  %331 = mul i32 %328, %330
  %332 = add i32 %331, 0
  %333 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %332
  %334 = load volatile i64, i64 addrspace(15829152)* %333
  %335 = add i32 %331, 8
  %336 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %335
  %337 = load volatile i64, i64 addrspace(15829152)* %336
  %338 = add i32 %331, 16
  %339 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %338
  %340 = load volatile i64, i64 addrspace(15829152)* %339
  %341 = add i32 %331, 24
  %342 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %341
  %343 = load volatile i64, i64 addrspace(15829152)* %342
  %344 = add i32 %331, 32
  %345 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %344
  %346 = load volatile i64, i64 addrspace(15829152)* %345
  %347 = add i32 %331, 40
  %348 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %347
  %349 = load volatile i64, i64 addrspace(15829152)* %348
  %350 = add i32 %331, 48
  %351 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %350
  %352 = load volatile i64, i64 addrspace(15829152)* %351
  %353 = add i32 %331, 56
  %354 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %353
  %355 = load volatile i64, i64 addrspace(15829152)* %354
  %356 = add i32 %331, 64
  %357 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %356
  %358 = load volatile i64, i64 addrspace(15829152)* %357
  %359 = add i32 %331, 72
  %360 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %359
  %361 = load volatile i64, i64 addrspace(15829152)* %360
  %362 = add i32 %331, 80
  %363 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %362
  %364 = load volatile i64, i64 addrspace(15829152)* %363
  %365 = add i32 %331, 88
  %366 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %365
  %367 = load volatile i64, i64 addrspace(15829152)* %366
  %368 = add i32 %331, 96
  %369 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %368
  %370 = load volatile i64, i64 addrspace(15829152)* %369
  %371 = add i32 %331, 104
  %372 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %371
  %373 = load volatile i64, i64 addrspace(15829152)* %372
  %374 = add i32 %331, 112
  %375 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %374
  %376 = load volatile i64, i64 addrspace(15829152)* %375
  %377 = add i32 %331, 120
  %378 = getelementptr i64, i64 addrspace(15829152)* %0, i32 %377
  %379 = load volatile i64, i64 addrspace(15829152)* %378
  br label %loop_epilogue

exit:                                             ; preds = %loop_epilogue
  ret void

loop_prologue:                                    ; preds = %entry
  %i = alloca i32
  store i32 0, i32* %i
  br label %Compute

loop_epilogue:                                    ; preds = %Memory
  %380 = load i32, i32* %i
  %381 = add i32 %380, 1
  store i32 %381, i32* %i
  %382 = load i32, i32* %i
  %383 = icmp ult i32 %382, 500000
  br i1 %383, label %Compute, label %exit
}
