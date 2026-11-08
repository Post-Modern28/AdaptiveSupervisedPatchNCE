#!/bin/bash
#SBATCH --job-name=train_nce
#SBATCH --partition=ais-gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2
#SBATCH --time=24:00:00
#SBATCH --output=logs/train_nce_filtered_%j.out
#SBATCH --error=logs/train_nce_filtered_%j.err

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ASP
python ~/benchmarking/BCI/PyramidPix2pix/check.py
nvidia-smi
cd ~/benchmarking/NCE
echo "Training..."
python -m experiments mist_filtered_25 train 0
echo "Testing..."
python -m experiments mist_filtered_25 test 0
echo "Done!"
