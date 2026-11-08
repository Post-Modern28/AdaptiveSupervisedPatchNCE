#!/bin/bash
#SBATCH --job-name=nce_retccl_25_train
#SBATCH --partition=ais-gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2
#SBATCH --time=24:00:00
#SBATCH --output=logs/train_retccl_15_more_epochs_%j.out
#SBATCH --error=logs/train_retccl_15_more_epochs_%j.err

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ASP
python ~/benchmarking/BCI/PyramidPix2pix/check.py
nvidia-smi
cd ~/benchmarking/NCE
echo "Training..."
python -m experiments mist_retccl_15 train 0
echo "Testing..."
python -m experiments mist_retccl_15 test 0
echo "Done!"
