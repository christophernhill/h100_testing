#!/bin/bash

#
# Install fresh CUDA
#

wdir=/tmp/${user}/spack_install
mkdir -p ${wdir}
cd ${wdir}

gccver=12.3.0
cudaver=12.1.1

git clone https://github.com/spack/spack.git
cd spack
git checkout v0.20.0
cd ..

rm ~/.spack
mkdir .spack
ln -s `pwd`/.spack ~/.spack

# Make sure basic bootstrap tools are installed  
# ( g++ was missing )
# dnf -y group install "Development Tools"


. spack/share/spack/setup-env.sh
spack compiler find

spack install gcc@${gccver}
cloc=$( spack find -p gcc@${gccver} | grep -v -e  '^--' -e '^==' | awk '{print $2}' )
spack compiler add ${cloc}

spack install cuda@${cudaver}%gcc@${gccver}
spack load cuda

