#!/bin/bash
#SBATCH --job-name=nch15t
#SBATCH --partition=ais-gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2
#SBATCH --time=2:00:00
#SBATCH --output=logs/test_hibou_15.out
#SBATCH --error=logs/test_hibou_15.err


unset PYTHONHOME
unset PYTHONPATH

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ASP
python ~/benchmarking/BCI/PyramidPix2pix/check.py
nvidia-smi
cd ~/benchmarking/NCE
echo "Testing..."
python -m experiments mist_hibou_15 test 0
echo "Done!"
