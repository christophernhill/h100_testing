#!/bin/bash
dnf -y install apptainer
dnf -y group install "Development Tools"
dnf -y install nvidia-fabric-manager-530.30.02
systemctl enable nvidia-fabricmanager
systemctl start nvidia-fabricmanager
