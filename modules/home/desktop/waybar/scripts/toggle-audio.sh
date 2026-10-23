#!/usr/bin/env bash
set -euo pipefail

mapfile -t SINKS < <(wpctl list audio sinks | awk '{print $1}')

if [ "${#SINKS[@]}" -le 1 ]; then
    echo "Less than 2 sinks found, exiting."
    exit 0
fi

CURRENT_ID=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -oP '^\s*id: \K\d+')

NEXT_ID=""
for i in "${!SINKS[@]}"; do
    if [ "${SINKS[$i]}" = "$CURRENT_ID" ]; then
        NEXT_ID=${SINKS[$(((i + 1) % ${#SINKS[@]}))]}
        break
    fi
done

if [ -n "$NEXT_ID" ]; then
    wpctl set-default "$NEXT_ID"
    echo "Switched to sink ID: $NEXT_ID"

    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
fi
