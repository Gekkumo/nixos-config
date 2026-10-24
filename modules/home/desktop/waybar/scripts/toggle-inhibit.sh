#!/usr/bin/env bash

if [ "$1" = "--status" ]; then
    if pgrep -x "my-inhibit" > /dev/null; then
        echo '{"text": "ON", "class": "activated"}'
    else
        echo '{"text": "OFF", "class": "deactivated"}'
    fi
    exit 0
fi

if pgrep -x "my-inhibit" > /dev/null; then
    pkill -x "my-inhibit"
else
    (systemd-inhibit --what=idle:sleep --who="my-inhibitor" --why="User toggled" --mode=block bash -c 'exec -a my-inhibit sleep 1800' > /dev/null 2>&1; pkill -SIGRTMIN+8 waybar) &
fi

pkill -SIGRTMIN+8 waybar
