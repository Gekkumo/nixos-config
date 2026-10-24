#!/usr/bin/env bash

PIDFILE="$XDG_RUNTIME_DIR/idle-inhibit.pid"

if [ "$1" = "--status" ]; then
    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        echo '{"text": "ON", "class": "activated"}'
    else
        echo '{"text": "OFF", "class": "deactivated"}'
    fi
    exit 0
fi

if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    kill "$(cat "$PIDFILE")"
    rm -f "$PIDFILE"
else
    systemd-inhibit --what=idle:sleep --who="my-inhibitor" --why="User toggled" --mode=block sleep 1800 > /dev/null 2>&1 &
    echo $! > "$PIDFILE"
fi

pkill -SIGRTMIN+8 waybar
