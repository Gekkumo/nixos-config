#!/usr/bin/env bash
STATUS=$(pomodoro status --format "%r" 2>/dev/null)
if [ -n "$STATUS" ]; then
  echo " $STATUS"
else
  echo "🍅"
fi
