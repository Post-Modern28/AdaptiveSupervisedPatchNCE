#!/bin/bash
#SBATCH --job-name=eval_nce
#SBATCH --partition=gpu_a100
#SBATCH --gres=gpu:1
#SBATCH --mem=80G
#SBATCH --cpus-per-task=2
#SBATCH --time=08:00:00
#SBATCH --output=logs/eval_nce_vlad.out
#SBATCH --error=logs/eval_nce_vlad.err

source ~/miniconda3/etc/profile.d/conda.sh
conda activate PSPStain
nvidia-smi
cd ~/benchmarking/NCE

echo "Evaluating..."
for e in 30 31 32 33 34
do
    echo "Evaluating epoch $e"
    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_${e}/images \
                           --output_csv ~/benchmarking/NCE/metrics/val_${e}.csv --batch_size 1 --num_workers 2
done

python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_latest/images \
                       --output_csv ~/benchmarking/NCE/metrics/val_latest.csv --batch_size 1 --num_workers 2
