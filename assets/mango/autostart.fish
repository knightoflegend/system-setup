#!/usr/bin/env fish
# ~/.config/mango/autostart.sh
# Minimal session autostart for MangoWM + DMS on CachyOS
# chmod +x ~/.config/mango/autostart.sh
# In ~/.config/mango/config.conf:
#   exec-once=~/.config/mango/autostart.sh

# Don't abort the rest if one helper is missing
status --is-interactive; or true

function __mango_have
    command -q $argv[1]
end

function __mango_start
    # usage: __mango_start cmd [args...]
    if not __mango_have $argv[1]
        return
    end
    $argv >/dev/null 2>&1 &
    disown
end

# Session env for portals, systemd user units, and DMS
if __mango_have dbus-update-activation-environment
    dbus-update-activation-environment --systemd \
        WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP \
        >/dev/null 2>&1
end

# Best polkit for this stack:
#   1. xfce-polkit  — recommended by Mango docs, light, works on wlroots
#   2. hyprpolkitagent — common on CachyOS Wayland
#   3. polkit-gnome — most compatible fallback
if test -x /usr/lib/xfce-polkit/xfce-polkit
    __mango_start /usr/lib/xfce-polkit/xfce-polkit
else if test -x /usr/libexec/xfce-polkit
    __mango_start /usr/libexec/xfce-polkit
else if __mango_have hyprpolkitagent
    __mango_start hyprpolkitagent
else if test -x /usr/lib/hyprpolkitagent/hyprpolkitagent
    __mango_start /usr/lib/hyprpolkitagent/hyprpolkitagent
else if test -x /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
    __mango_start /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
end

# Removable media automount (udisks2 + udiskie)
# --no-notify keeps it quiet if DMS already shows notifications
__mango_start udiskie --automount --notify --no-tray

# Clipboard: persist across close + feed cliphist for DMS Super+V
__mango_start wl-clip-persist --clipboard regular --reconnect-tries 0
__mango_start wl-paste --type text --watch cliphist store
__mango_start wl-paste --type image --watch cliphist store

# Network / Bluetooth
# NetworkManager + bluetoothd are system services; these are the session pieces.
# Skip tray applets if you only use DMS control center — keep them if you want tray icons.
__mango_start nm-applet --indicator
__mango_start blueman-applet

# Portal helper if the session doesn't start it
if test -x /usr/lib/xdg-desktop-portal-wlr
    __mango_start /usr/lib/xdg-desktop-portal-wlr
else if test -x /usr/libexec/xdg-desktop-portal-wlr
    __mango_start /usr/libexec/xdg-desktop-portal-wlr
end

# DMS: start only if not already managed by systemd --user
if __mango_have dms
    if not systemctl --user is-active --quiet dms.service 2>/dev/null
        __mango_start dms run
    end
end