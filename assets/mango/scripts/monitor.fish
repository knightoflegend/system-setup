#!/usr/bin/env fish
# Toggle the laptop panel (eDP-1) on/off.

set -l enable (wlr-randr --json | jq --arg name eDP-1 '.[] | select(.name == $name) | .enabled')

if test "$enable" = true
    wlr-randr --output eDP-1 --off
else
    wlr-randr --output eDP-1 --on
end