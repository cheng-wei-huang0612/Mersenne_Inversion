#!/bin/bash

for i in $(seq 20 39); do
    idx=$(printf "%03d" "$i") # 20 -> 020, 21 -> 021, ...
    for suffix in a b c; do
        file="divstep_${idx}_${suffix}.cl"
        if [ -f "$file" ]; then
            echo "cv $file"
            cv "$file"
        fi
    done
done
