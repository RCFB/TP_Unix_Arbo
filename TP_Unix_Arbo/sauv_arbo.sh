#!/bin/bash

racine="/tmp/ARBO/"

rand_5_10=$((5+$RANDOM%(1+10-5)))

rand_file=$((6+$RANDOM%(1+8-6)))


rm -r $racine

mkdir $racine
for rep1 in $(seq 1 $rand_5_10)
do rand_rep=$((4+$RANDOM%(1+6-4)))
repname1="$racine"$(cat /dev/urandom |tr -dc [:lower:] | head -c $rand_rep ; echo)
mkdir -v $repname1
rand_15_25=$((15+$RANDOM%(1+25-15)))

    for file1 in $(seq 1 $rand_15_25)
    do rand_file=$((6+$RANDOM%(1+8-6)))
    filename1=$(cat /dev/urandom |tr -dc 'a-z0-9_-' | head -c $rand_file ; echo)
    touch "$repname1/"$filename1
    done

    rand_1_5=$((1+$RANDOM%(1+5-1)))
    for rep2 in $(seq 1 $rand_1_5)
    do rand_rep=$((4+$RANDOM%(1+6-4)))
    repname2="$repname1/"$(cat /dev/urandom |tr -dc [:lower:] | head -c $rand_rep ; echo)
    mkdir -v $repname2
    rand_15_25=$((15+$RANDOM%(1+25-15)))

        for file2 in $(seq 1 $rand_15_25)
        do rand_file=$((6+$RANDOM%(1+8-6)))
        filename2=$(cat /dev/urandom |tr -dc 'a-z0-9_-' | head -c $rand_file ; echo)
        touch "$repname2/"$filename2
        done
        rand_1_5=$((1+$RANDOM%(1+5-1)))

        for rep3 in $(seq 1 $rand_5_10)
        do rand_rep=$((4+$RANDOM%(1+6-4)))
        repname3="$repname2/"$(cat /dev/urandom |tr -dc [:lower:] | head -c $rand_rep ; echo)
        mkdir -v $repname3
        rand_15_25=$((15+$RANDOM%(1+25-15)))

            for file3 in $(seq 1 $rand_15_25)
            do rand_file=$((6+$RANDOM%(1+8-6)))
            filename3=$(cat /dev/urandom |tr -dc 'a-z0-9_-' | head -c $rand_file ; echo)
            touch "$repname3/"$filename3
            done
        done
    done
done