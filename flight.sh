#!/bin/bash
#host ganti hostmu
hosts=(
    'http://104.18.49.163/'
    'http://104.18.49.163/'
    'http://104.18.49.163/'
)

while true; do
    success_count=0

    for host in "${hosts[@]}"; do
        if curl "$host" --connect-timeout 5 >/dev/null 2>&1; >
            ((success_count++))
        else
            echo "[$host] Failed to connect"
        fi
    done

    if [ $success_count -eq 0 ]; then
        sudo cmd connectivity airplane-mode enable
        sudo cmd connectivity airplane-mode disable
        echo "[System] Enable flight mode"
        sleep 6
    fi
done
