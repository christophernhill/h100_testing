module load gcc/12.2.0-x86_64  
module load cuda/12.1.0-x86_64 
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/nfs/software001/home/software-r8-x86_64/spack-20230328/opt/spack/linux-rocky8-x86_64/gcc-12.2.0/cuda-12.1.0-loulnd3xxa433rvdvtzu67nb4muiyxqt/
gcc -g -o mig -I`pkgconf --variable=includedir nvidia-ml-12.1` -L`pkgconf --variable=libdir  nvidia-ml-12.1` mig.c  -lnvidia-ml