# cd /nobackup/users/cnh
# mkdir h100-test
# cd h100-test
#
\rm -fr Miniconda3-latest-Linux-x86_64.sh
\rm -fr minic
\rm -fr test.py
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -p minic
. ./minic/bin/activate 
conda create -y -n pytorch_test python=3.10
conda activate pytorch_test                          
conda install -y -c conda-forge cupy
# conda deactivate
# conda deactivate

pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu121
cat > test.py <<'EOF'
import torch
device_id = torch.cuda.current_device()
gpu_properties = torch.cuda.get_device_properties(device_id)
print("Found %d GPUs available. Using GPU %d (%s) of compute capability %d.%d with "
          "%.1fGb total memory.\n" % 
          (torch.cuda.device_count(),
          device_id,
          gpu_properties.name,
          gpu_properties.major,
          gpu_properties.minor,
          gpu_properties.total_memory / 1e9))
EOF

python test.py
