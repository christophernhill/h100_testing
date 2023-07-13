
mig-parted https://github.com/NVIDIA/mig-parted.git is a tool for specifying configuration profiles that can be applied to a GPU machine to 

 1. split the available GPUs into a larger set of smaller, independent virtaul GPUs
 2. join split GPUs back into their original physical device divisions



To compile

First make sure go is installed.

To install go via spack

  `$ export SPACK_USER_CONFIG_PATH=${MIG_PARTED_ENV_ROOT}/spack_user_etc`
  
  `$ cat spack_user_etc/upstreams.yaml`
  
  ```
  upstreams:
      spack-instance-1:
                install_tree: /nfs/software001/home/software-r8-x86_64/spack-20230328/opt/spack
                modules:
                        tcl: /nfs/software001/home/software-r8-x86_64/spack-20230328/share/spack/modules
 ```
    

```
spack install go arch=x86_64
```

```
spack module tcl  refresh -y
spack module lmod refresh -y
```
