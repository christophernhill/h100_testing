#!/bin/bash

wdir=/tmp/${user}/julia
mkdir -p ${wdir}
cd ${wdir}

wget https://julialang-s3.julialang.org/bin/linux/x64/1.9/julia-1.9.1-linux-x86_64.tar.gz
tar -xzvf julia-1.9.1-linux-x86_64.tar.gz

mkdir -p test
cd test

export JULIA_DEPOT_PATH=`pwd`/.julia

cat > test.jl <<'EOF'
using Pkg
Pkg.add("CUDA")

using CUDA
N=1000000
x_d = CUDA.fill(1.0f0, N)  # a vector stored on the GPU filled with 1.0 (Float32)
y_d = CUDA.fill(2.0f0, N)  # a vector stored on the GPU filled with 2.0
y_d .+= x_d
@test all(Array(y_d) .== 3.0f0)

EOF


../julia-1.9.1/bin/julia --project=. test.jl

