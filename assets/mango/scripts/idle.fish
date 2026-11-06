#!/usr/bin/env fish
# idle.fish - Handle idle actions

swayidle -w \
    timeout 300 'dms ipc call lock lock' \
    timeout 600 'wlr-randr --output eDP-1 --off' \
    resume 'wlr-randr --output eDP-1 --on' \
    before-sleep 'dms ipc call lock lock'