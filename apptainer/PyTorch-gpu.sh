#!/bin/bash

wdir=/tmp/${USER}/apptainer
mkdir -p ${wdir}
cd ${wdir}

export APPTAINER_CACHEDIR=/tmp/cnh/apptainer-temporary-cache
apptainer pull docker://nvcr.io/nvidia/pytorch:23.05-py3

