cd ~/benchmarking/NCE/results/test


for e in "latest" #30 31 32 33 34
do
    echo "Verifying epoch $e"
    cd val_$e
    echo "Verifying good"
    cd good 
    ls real_A | wc -l
    ls real_B | wc -l
    ls fake_B | wc -l

    echo "Verifying norm"
    cd ../norm
    ls real_A | wc -l
    ls real_B | wc -l
    ls fake_B | wc -l

    echo "Verifying comb"
    cd ../comb
    ls real_A | wc -l
    ls real_B | wc -l
    ls fake_B | wc -l
    cd ..
    cd ..
done