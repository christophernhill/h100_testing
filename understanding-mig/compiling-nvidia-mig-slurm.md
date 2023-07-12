compile source for mig program from https://gitlab.com/nvidia/hpc/slurm-mig-discovery.git

```
module load gcc/12.2.0-x86_64  
module load cuda/12.1.0-x86_64 
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:$( dirname $( dirname `which nvcc`) )
git clone https://gitlab.com/nvidia/hpc/slurm-mig-discovery.git
cd slurm-mig-discovery
gcc -g -o mig -I`pkgconf --variable=includedir nvidia-ml-12.1` -L`pkgconf --variable=libdir  nvidia-ml-12.1` mig.c  -lnvidia-ml
./mig
```

this produces  `.conf` files for slurm `gres.conf` and `cgroup_allowed_devices_file.conf` e.g.

```
cat gres.conf
```

```
# GPU 0 MIG 0 /proc/driver/nvidia/capabilities/gpu0/mig/gi7/access
Name=gpu Type=1g.10gb File=/dev/nvidia-caps/nvidia-cap66

# GPU 0 MIG 1 /proc/driver/nvidia/capabilities/gpu0/mig/gi8/access
Name=gpu Type=1g.10gb File=/dev/nvidia-caps/nvidia-cap75

# GPU 0 MIG 2 /proc/driver/nvidia/capabilities/gpu0/mig/gi9/access
Name=gpu Type=1g.10gb File=/dev/nvidia-caps/nvidia-cap84

:
:
```

and

```
cat cgroup_allowed_devices_file.conf
```

```
# GPU 0
/dev/nvidia0

# GPU 0 MIG /proc/driver/nvidia/capabilities/gpu0/mig/gi7/ci0/access
/dev/nvidia-caps/nvidia-cap67

# GPU 0 MIG /proc/driver/nvidia/capabilities/gpu0/mig/gi8/ci0/access
/dev/nvidia-caps/nvidia-cap76

# GPU 0 MIG /proc/driver/nvidia/capabilities/gpu0/mig/gi9/ci0/access
/dev/nvidia-caps/nvidia-cap85

:
:
/dev/null
/dev/urandom
/dev/zero
/dev/cpu/*/*
/dev/pts/*
```
