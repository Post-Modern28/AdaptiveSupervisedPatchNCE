#!/bin/bash
#SBATCH --job-name=eval_nce
#SBATCH --partition=gpu_a100
#SBATCH --gres=gpu:1
#SBATCH --mem=80G
#SBATCH --cpus-per-task=2
#SBATCH --time=08:00:00
#SBATCH --output=logs/eval_nce_filtered.out
#SBATCH --error=logs/eval_nce_filtered.err

source ~/miniconda3/etc/profile.d/conda.sh
conda activate PSPStain
nvidia-smi
cd ~/benchmarking/NCE

echo "Evaluating..."
for e in 30 31 32 33 34
do
    echo "Evaluating epoch $e"
    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_${e}/good \
                           --output_csv ~/benchmarking/NCE/metrics/val_${e}_good.csv --batch_size 1 --num_workers 2
                           
    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_${e}/norm \
                           --output_csv ~/benchmarking/NCE/metrics/val_${e}_norm.csv --batch_size 1 --num_workers 2
                           
    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_${e}/comb \
                           --output_csv ~/benchmarking/NCE/metrics/val_${e}_comb.csv --batch_size 1 --num_workers 2
done

    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_latest/good \
                           --output_csv ~/benchmarking/NCE/metrics/val_latest_good.csv --batch_size 1 --num_workers 2
                           
    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_latest/norm \
                           --output_csv ~/benchmarking/NCE/metrics/val_latest_norm.csv --batch_size 1 --num_workers 2
                           
    python eval_by_vlad.py --results_dir ~/benchmarking/NCE/results/test/val_latest/comb \
                           --output_csv ~/benchmarking/NCE/metrics/val_latest_comb.csv --batch_size 1 --num_workers 2