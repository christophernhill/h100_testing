#!/bin/bash

wdir=/tmp/${user}/spack_install
mkdir -p ${wdir}
cd ${wdir}

git clone https://github.com/spack/spack.git
cd spack
git checkout v0.20.0
cd ..

rm ~/.spack
mkdir .spack
ln -s `pwd`/.spack ~/.spack

# Make sure basic bootstrap tools are installed  
# ( g++ was missing )
dnf -y group install "Development Tools"

./spack/bin/spack info gcc
./spack/bin/spack install gcc@12.3

