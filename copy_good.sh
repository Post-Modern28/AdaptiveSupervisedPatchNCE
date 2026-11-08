cd ~/benchmarking/NCE


# for e in 30 31 32 33 34
# do
#     echo "Copying epoch $e"
#     ~/benchmarking/copy_images.sh ~/benchmarking/good_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_A ~/benchmarking/NCE/results/test/val_$e/good/real_A
#     ~/benchmarking/copy_images.sh ~/benchmarking/good_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_B ~/benchmarking/NCE/results/test/val_$e/good/real_B
#     ~/benchmarking/copy_images.sh ~/benchmarking/good_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/fake_B ~/benchmarking/NCE/results/test/val_$e/good/fake_B
    
#     ~/benchmarking/copy_images.sh ~/benchmarking/norm_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_A ~/benchmarking/NCE/results/test/val_$e/norm/real_A
#     ~/benchmarking/copy_images.sh ~/benchmarking/norm_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_B ~/benchmarking/NCE/results/test/val_$e/norm/real_B
#     ~/benchmarking/copy_images.sh ~/benchmarking/norm_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/fake_B ~/benchmarking/NCE/results/test/val_$e/norm/fake_B
    
#     ~/benchmarking/copy_images.sh ~/benchmarking/combined_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_A ~/benchmarking/NCE/results/test/val_$e/comb/real_A
#     ~/benchmarking/copy_images.sh ~/benchmarking/combined_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_B ~/benchmarking/NCE/results/test/val_$e/comb/real_B
#     ~/benchmarking/copy_images.sh ~/benchmarking/combined_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/fake_B ~/benchmarking/NCE/results/test/val_$e/comb/fake_B  
# done


echo "Copying epoch latest"
    ~/benchmarking/copy_images.sh ~/benchmarking/good_clean.txt ~/benchmarking/NCE/results/test/val_latest/images/real_A ~/benchmarking/NCE/results/test/val_$e/good/real_A
    ~/benchmarking/copy_images.sh ~/benchmarking/good_clean.txt ~/benchmarking/NCE/results/test/val_latest/images/real_B ~/benchmarking/NCE/results/test/val_$e/good/real_B
    ~/benchmarking/copy_images.sh ~/benchmarking/good_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/fake_B ~/benchmarking/NCE/results/test/val_$e/good/fake_B
    
    ~/benchmarking/copy_images.sh ~/benchmarking/norm_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_A ~/benchmarking/NCE/results/test/val_$e/norm/real_A
    ~/benchmarking/copy_images.sh ~/benchmarking/norm_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_B ~/benchmarking/NCE/results/test/val_$e/norm/real_B
    ~/benchmarking/copy_images.sh ~/benchmarking/norm_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/fake_B ~/benchmarking/NCE/results/test/val_$e/norm/fake_B
    
    ~/benchmarking/copy_images.sh ~/benchmarking/combined_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_A ~/benchmarking/NCE/results/test/val_$e/comb/real_A
    ~/benchmarking/copy_images.sh ~/benchmarking/combined_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/real_B ~/benchmarking/NCE/results/test/val_$e/comb/real_B
    ~/benchmarking/copy_images.sh ~/benchmarking/combined_clean.txt ~/benchmarking/NCE/results/test/val_$e/images/fake_B ~/benchmarking/NCE/results/test/val_$e/comb/fake_B  