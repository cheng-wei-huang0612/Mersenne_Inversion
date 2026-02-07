

set -u  # 未定義變數視為錯誤

for i in {1..20}; do
    for suffix in a b c; do
        file="divstep_${i}_${suffix}.cl"
        if [[ -f "$file" ]]; then
            echo "Running cv on $file ..."
            cv  -vo lex "$file"
        else
            echo "Warning: file $file not found, skipped."
        fi
    done
done

