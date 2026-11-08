#!/bin/bash
#SBATCH --job-name=eval_nce
#SBATCH --partition=gpu_devel
#SBATCH --gres=gpu:1
#SBATCH --mem=40G
#SBATCH --cpus-per-task=2
#SBATCH --time=08:00:00
#SBATCH --output=logs/eval_retccl.out
#SBATCH --error=logs/eval_retccl.err

source ~/miniconda3/etc/profile.d/conda.sh
conda activate PSPStain
nvidia-smi
cd ~/benchmarking/NCE

echo "Evaluating more epochs"
# NCE_retccl_25_more_epochs
for type in NCE_retccl_15_more_epochs 
do 


    mkdir -p  ~/benchmarking/NCE/metrics/retccl/${type}
    python eval_extended.py --results_dir ~/benchmarking/NCE/results/${type}/val_latest/images \
                           --output_csv ~/benchmarking/NCE/metrics/retccl/${type}/val_latest.csv --batch_size 1 --num_workers 2
                           
    python eval_extended.py --results_dir ~/benchmarking/NCE/results/${type}/val_latest/good \
                           --output_csv ~/benchmarking/NCE/metrics/retccl/${type}/val_latest_good.csv --batch_size 1 --num_workers 2
                           
    python eval_extended.py --results_dir ~/benchmarking/NCE/results/${type}/val_latest/norm \
                           --output_csv ~/benchmarking/NCE/metrics/retccl/${type}/val_latest_norm.csv --batch_size 1 --num_workers 2
                           
    python eval_extended.py --results_dir ~/benchmarking/NCE/results/${type}/val_latest/comb \
                           --output_csv ~/benchmarking/NCE/metrics/retccl/${type}/val_latest_comb.csv --batch_size 1 --num_workers 2
done

#     python eval_extended.py --results_dir ~/benchmarking/NCE/results/NCE_filtered_25/val_latest/images \
#                        --output_csv ~/benchmarking/NCE/metrics/filtered/val_latest.csv --batch_size 1 --num_workers 2
                           
#     python eval_extended.py --results_dir ~/benchmarking/NCE/results/NCE_filtered_25/val_latest/good \
#                            --output_csv ~/benchmarking/NCE/metrics/filtered/val_latest_good.csv --batch_size 1 --num_workers 2
                           
#     python eval_extended.py --results_dir ~/benchmarking/NCE/results/NCE_filtered_25/val_latest/norm \
#                            --output_csv ~/benchmarking/NCE/metrics/filtered/val_latest_norm.csv --batch_size 1 --num_workers 2
                           
    # python eval_extended.py --results_dir ~/benchmarking/NCE/results/NCE_filtered_25/val_latest/combined \
    #                        --output_csv ~/benchmarking/NCE/metrics/filtered/val_latest_comb.csv --batch_size 1 --num_workers 2