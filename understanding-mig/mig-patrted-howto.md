
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
spack spec -t go arch=x86_64
spack install go arch=x86_64
```

```
spack module tcl  refresh -y
spack module lmod refresh -y
```

```

```

Next create a config file e.g.

```
$ cat config.yaml

version: v1
mig-configs:

        all-disabled:
        - devices: all
          mig-enabled: false

        all-mig:       
        - devices: all
          mig-enabled: true
          mig-devices:
            1g.10gb: 7


```
