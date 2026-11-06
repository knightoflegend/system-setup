#!/usr/bin/fish

function find_headless_display
    wlr-randr --json | jq -r '.[] | select(.name | startswith("HEADLESS-")) | .name' | head -n 1
end

set HEADLESS_DISPLAY (find_headless_display)

if test -z "$HEADLESS_DISPLAY"
    mmsg dispatch create_virtual_output
    notify-send "Creating virtual monitor"
    set HEADLESS_DISPLAY (find_headless_display)
    notify-send "Starting sunshine"
    sunshine &
    notify-send "Sunshine on"
    exit 0
end

set enable (wlr-randr --json | jq --arg name "$HEADLESS_DISPLAY" '.[] | select(.name == $name) | .enabled')

if test "$enable" = "true"
    wlr-randr --output "$HEADLESS_DISPLAY" --off
    pkill sunshine
    notify-send "Sunshine off"
    mmsg dispatch destroy_all_virtual_output
    notify-send "Removed virtual monitor"
    wlr-randr --output eDP-1 --pos 0,0 --scale 1
else
    wlr-randr --output "$HEADLESS_DISPLAY" --on
    sunshine &
    notify-send "Sunshine on"
end