; ModuleID = 'TuSimple'

%struct.List = type { i32, i32, i8**, i32 }

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare %struct.List* @create_list(i32)

declare %struct.List* @plus_list(%struct.List*, ...)

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  %l1 = alloca %struct.List*
  ret i32 0
}
