#!/usr/bin/env fish
# config_check.fish - Validate MangoWM config

set -l config_file ~/.config/mango/config.conf

if test -f $config_file
    mangowm --check-config $config_file
    if test $status -eq 0
        echo "Config OK"
    else
        echo "Config has errors"
    end
else
    echo "Config file not found: $config_file"
end