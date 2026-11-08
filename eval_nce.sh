#!/bin/bash
#SBATCH --job-name=eval_nce
#SBATCH --partition=gpu_devel
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=2
#SBATCH --time=08:00:00
#SBATCH --output=logs/eval_nce_cascade_%j.out
#SBATCH --error=logs/eval_nce_cascade_%j.err

source ~/miniconda3/etc/profile.d/conda.sh
conda activate ASP
nvidia-smi
cd ~/benchmarking/NCE
echo "Evaluating..."
for e in 30 31 32 33 34
do
    echo "Evaluating epoch $e"
    python evaluate.py --epoch $e
done
python evaluate.py --epoch latest

