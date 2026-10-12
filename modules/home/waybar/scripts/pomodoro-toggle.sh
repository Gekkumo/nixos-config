#!/usr/bin/env bash
if pomodoro status --format "%r" 2>/dev/null | grep -qE '^[0-9]'; then
  exit 0
fi

pomodoro start
pkill -SIGRTMIN+8 waybar

(
  while pomodoro status --format "%r" 2>/dev/null | grep -qE '^[0-9]'; do
    pkill -SIGRTMIN+8 waybar
    sleep 1
  done
  pkill -SIGRTMIN+8 waybar
) &

pomodoro status --wait
pw-play ~/.config/waybar/scripts/notification.wav

ACTION=$(notify-send \
  --urgency=critical \
  --action="default=Start break" \
  --wait \
  "Pomodoro finished!" \
  "Click to start 5-minute break")

if [ "$ACTION" = "default" ]; then
  pomodoro break 5
  pkill -SIGRTMIN+8 waybar

  pomodoro status --wait
  pkill -SIGRTMIN+8 waybar

  pw-play ~/.config/waybar/scripts/notification.wav

  notify-send \
    --urgency=critical \
    --action="default=Start new pomodoro" \
    --wait \
    "Break finished!" \
    "Click to start new pomodoro" | while read -r action; do
      if [ "$action" = "default" ]; then
        exec ~/.config/waybar/scripts/pomodoro-toggle.sh
      fi
    done
fi
