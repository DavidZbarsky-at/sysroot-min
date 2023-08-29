curl -L "https://github.com/llvm/llvm-project/releases/download/llvmorg-16.0.3/$NAME" -o src.tar.xz
tar -xf src.tar.xz
mkdir -p bin
cp src/bin/clang bin/clang
cp src/bin/lld bin/lld
tar -czf "$NAME" bin/
