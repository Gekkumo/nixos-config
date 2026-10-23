#!/usr/bin/env bash
set -euo pipefail

mapfile -t SINKS < <(pactl list short sinks | grep -v "monitor" | awk '{print $2}')

if [ "${#SINKS[@]}" -le 1 ]; then
    echo "Less than 2 sinks found, exiting."
    exit 0
fi

CURRENT=$(pactl get-default-sink)

NEXT=""
for i in "${!SINKS[@]}"; do
    if [ "${SINKS[$i]}" = "$CURRENT" ]; then
        NEXT=${SINKS[$(((i + 1) % ${#SINKS[@]}))]}
        break
    fi
done

if [ -n "$NEXT" ]; then
    pactl set-default-sink "$NEXT"
    echo "Switched to: $NEXT"

    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
fi
