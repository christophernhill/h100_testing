module load gcc/12.2.0-x86_64  
module load cuda/12.1.0-x86_64 
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:$( dirname $( dirname `which nvcc`) )
gcc -g -o mig -I`pkgconf --variable=includedir nvidia-ml-12.1` -L`pkgconf --variable=libdir  nvidia-ml-12.1` mig.c  -lnvidia-ml
