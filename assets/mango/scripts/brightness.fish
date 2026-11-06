#!/usr/bin/env fish
# brightness.fish [up|down]
# Change brightness via swayosd (brightnessctl kept as fallback helpers).

function get_brightness
    set -l var (brightnessctl get)
    echo $var | string replace -r '[^0-9.].*' ''
end

function send_notification
    set -l brightness (get_brightness)
    set -l icon_name "$HOME/.config/rice_assets/Icons/b.png"

    dunstify "Brightness: $brightness%" \
        -h int:value:$brightness \
        -i /usr/share/icons/Adwaita/96x96/status/display-brightness-symbolic.symbolic.png \
        -t 1000 --replace=555 -u low
end

switch $argv[1]
    case up
        swayosd-client --brightness +2
        # brightnessctl set +1%
        # send_notification
    case down
        swayosd-client --brightness -2
        # brightnessctl set 1%-
        # send_notification
    case '*'
        echo "usage: brightness.fish [up|down]" >&2
        exit 1
end