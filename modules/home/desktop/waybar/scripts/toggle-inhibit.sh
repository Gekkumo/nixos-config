#!/usr/bin/env bash
if [ "$1" = "--status" ]; then
    if pgrep -f "systemd-inhibit.*my-inhibitor" > /dev/null; then
        echo '{"text": "ON", "class": "activated"}'
    else
        echo '{"text": "OFF", "class": "deactivated"}'
    fi
    exit 0
fi

if pgrep -f "systemd-inhibit.*my-inhibitor" > /dev/null; then
    pkill -f "systemd-inhibit.*my-inhibitor"
else
    systemd-inhibit --what=idle:sleep --who="my-inhibitor" --why="User toggled" --mode=block sleep infinity > /dev/null 2>&1 &
fi
