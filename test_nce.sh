#!/bin/bash
#SBATCH --job-name=test_nce
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2
#SBATCH --time=02:00:00
#SBATCH --output=logs/inference_NCE_baseline.out
#SBATCH --error=logs/inference_NCE_baseline.err

unset PYTHONHOME
unset PYTHONPATH
source ~/miniconda3/etc/profile.d/conda.sh
conda activate ASP
python ~/benchmarking/BCI/PyramidPix2pix/check.py
nvidia-smi
cd ~/benchmarking/NCE

# for e in 30 40
# do
#     echo "Testing epoch $e" 
#     python -m experiments mist test 0 --which_epoch $e
# done

# echo "Testing latest epoch"
# python -m experiments mist_random_15 test 0

echo "Testing latest epoch"
python -m experiments mist test 0