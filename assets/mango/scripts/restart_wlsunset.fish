#!/usr/bin/env fish
# restart_wlsunset.fish - Restart wlsunset for color temperature

pkill wlsunset
wlsunset -l 0 -L 0 -t 6500 -T 3500 &