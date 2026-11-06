#!/usr/bin/env fish
# volume.fish [up|down|mute]
# Changes volume of the default sink.
# No cap is applied — stay at or under 150%.

function get_volume
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{printf $5}' | string replace '%' ''
end

function is_mute
    pactl get-sink-mute @DEFAULT_SINK@
end

function send_notification
    set -l overvolume (get_volume)
    set -l volume $overvolume
    if test $overvolume -gt 100
        set volume 100
    end

    set -l icon_name
    if test $volume -eq 0
        set icon_name "$HOME/.config/rice_assets/Icons/nov.png"
    else if test $volume -lt 35
        set icon_name "$HOME/.config/rice_assets/Icons/vlow.png"
    else if test $volume -lt 70
        set icon_name "$HOME/.config/rice_assets/Icons/vmid.png"
    else if test $volume -lt 100
        set icon_name "$HOME/.config/rice_assets/Icons/vhigh.png"
    else
        set icon_name "$HOME/.config/rice_assets/Icons/vthigh.png"
    end

    dunstify "Volume: $overvolume%" \
        -h int:value:$volume \
        -i /usr/share/icons/Adwaita/96x96/status/audio-volume-medium-symbolic.symbolic.png \
        -t 1000 --replace=555 -u normal
end

switch $argv[1]
    case up
        swayosd-client --output-volume 5
    case down
        swayosd-client --output-volume -5
    case mute
        pactl set-sink-mute @DEFAULT_SINK@ toggle >/dev/null
        if string match -q 'Mute: yes' (is_mute)
            dunstify -i "$HOME/.config/rice_assets/Icons/mute.png" \
                --replace=555 -u critical "Volume: Mute" -t 1000
        else
            send_notification
        end
    case '*'
        echo "usage: volume.fish [up|down|mute]" >&2
        exit 1
end