#!/usr/bin/env bash
set -euo pipefail

CURRENT_ID=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -oP '^id \K\d+')

ALL_IDS_STR=$(pw-dump | jq -r '.[] | select(.type == "PipeWire:Interface:Node" and .info.props["media.class"] == "Audio/Sink") | .id' | sort -n)

NEXT_ID=""
IS_NEXT=0
for id in $ALL_IDS_STR; do
  if [ "$IS_NEXT" -eq 1 ]; then
    NEXT_ID=$id
    break
  fi
  if [ "$id" = "$CURRENT_ID" ]; then
    IS_NEXT=1
  fi
done

if [ -z "$NEXT_ID" ]; then
  for id in $ALL_IDS_STR; do
    NEXT_ID=$id
    break
  done
fi

if [ -n "$NEXT_ID" ]; then
  wpctl set-default "$NEXT_ID"

  wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
fi
