#!/bin/sh
TUSIMPLE="./tusimple.native"
basename=`echo $1 | sed 's/.*\\///
                             s/.tu//'`
LLI="lli"
#LLI="/usr/local/opt/llvm/bin/lli"

# Path to the LLVM compiler
LLC="llc"

# Path to the C compiler
CC="cc"
Run() {
    echo $* 1>&2
    eval $* || {
	SignalError "$1 failed on $*"
	return 1
    }
}

Run "$TUSIMPLE" "<" $1 ">" "${basename}.ll" &&
Run "$LLC" "${basename}.ll" ">" "${basename}.s" &&
Run "$CC" "-o" "${basename}.exe" "${basename}.s" "./Lib/utils.o" "printbig.o " &&
Run "./${basename}.exe" > "${basename}.out"
