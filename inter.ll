; ModuleID = 'MicroC'

@b = global i0 0
@a = global i0 0
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare i32 @printbig(i32)

define i32 @main() {
entry:
  ret i32 0
}
