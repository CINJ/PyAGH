#!/bin/zsh
if [[ $(uname -m) == "arm64" ]]; then
export LLVM_DIR="/opt/homebrew/Cellar/llvm/"
export LLVM_VERSION=$(ls $LLVM_DIR | sort -V | tail -n 1)
export LLVM_CONFIG="$LLVM_DIR$LLVM_VERSION/bin/llvm-config"
fi

