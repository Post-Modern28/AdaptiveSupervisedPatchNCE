#!/bin/bash
#SBATCH --job-name=nce_hib_e
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=4
#SBATCH --time=3:00:00
#SBATCH --output=logs/eval_hibou_15.out
#SBATCH --error=logs/eval_hibou_15.err


unset PYTHONHOME
unset PYTHONPATH
source ~/miniconda3/etc/profile.d/conda.sh
conda activate PSPStain
cd ~/benchmarking/NCE
nvidia-smi



EXPERIMENTS=(
    "NCE_hibou_15"
)

for exp in "${EXPERIMENTS[@]}"; do
    echo "========================================="
    echo "Processing: $exp"
    echo "========================================="

    python ~/benchmarking/metrics/evaluate_metrics.py \
        --results_dir ./results/${exp}/val_latest/images \
        --batch_size 20 \
        --num_workers 4 \
        --image_format subdirs

    echo "Done: $exp"
    echo
done

echo "All experiments completed"





