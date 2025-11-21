#!/bin/bash

for i in $(seq 0 19); do
    idx=$(printf "%03d" "$i")
    for suffix in a b c; do
        file="divstep_${idx}_${suffix}.cl"
        if [ -f "$file" ]; then
            echo "cv $file"
            cv "$file"
        fi
    done
done
