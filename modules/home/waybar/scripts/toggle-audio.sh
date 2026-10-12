#!/usr/bin/env bash
WPCTL="wpctl"

SINKS=($($WPCTL status | sed -n '/Sinks:/,/Sources:/p' | grep -oP '^\s*│\s+\d+' | grep -oP '\d+' | while read id; do
    name=$($WPCTL inspect "$id" 2>/dev/null | grep 'node.name' | head -1)
    if [[ "$name" != *".monitor"* ]]; then
        echo "$id"
    fi
done))

[ "${#SINKS[@]}" -le 1 ] && exit 0

CURRENT=$($WPCTL status | grep '\*' | grep -oP '^\s*│\s+\K\d+')

NEXT=""
for i in "${!SINKS[@]}"; do
    if [ "${SINKS[$i]}" = "$CURRENT" ]; then
        NEXT=${SINKS[$(((i + 1) % ${#SINKS[@]}))]}
        break
    fi
done

[ -n "$NEXT" ] && $WPCTL set-default "$NEXT"
