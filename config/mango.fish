#!/usr/bin/env fish
# MangoWM configuration deployment

function deploy_mango_config
    set -l target_dir "$HOME/.config/mango"
    mkdir_p "$target_dir"

    # Main configs
    deploy_file "$ASSETS_DIR/mango/config.conf" "$target_dir/config.conf" "Mango config"
    deploy_file "$ASSETS_DIR/mango/bind.conf" "$target_dir/bind.conf" "Mango keybindings"
    deploy_file "$ASSETS_DIR/mango/rule.conf" "$target_dir/rule.conf" "Mango window rules"
    deploy_file "$ASSETS_DIR/mango/autostart.fish" "$target_dir/autostart.fish" "Mango autostart"
    deploy_file "$ASSETS_DIR/mango/env.conf" "$target_dir/env.conf" "Mango env"
    deploy_file "$ASSETS_DIR/mango/monitor.conf" "$target_dir/monitor.conf" "Mango monitor"
    deploy_file "$ASSETS_DIR/mango/tag.conf" "$target_dir/tag.conf" "Mango tags"

    # Scripts
    mkdir_p "$target_dir/scripts"
    deploy_file "$ASSETS_DIR/mango/scripts/volume.fish" "$target_dir/scripts/volume.fish" "Volume script"
    deploy_file "$ASSETS_DIR/mango/scripts/brightness.fish" "$target_dir/scripts/brightness.fish" "Brightness script"
    deploy_file "$ASSETS_DIR/mango/scripts/monitor.fish" "$target_dir/scripts/monitor.fish" "Monitor script"
    deploy_file "$ASSETS_DIR/mango/scripts/virmon.fish" "$target_dir/scripts/virmon.fish" "Virtual monitor script"
    deploy_file "$ASSETS_DIR/mango/scripts/idle.fish" "$target_dir/scripts/idle.fish" "Idle script"
    deploy_file "$ASSETS_DIR/mango/scripts/restart_wlsunset.fish" "$target_dir/scripts/restart_wlsunset.fish" "Wlsunset restart script"
    deploy_file "$ASSETS_DIR/mango/scripts/config_check.fish" "$target_dir/scripts/config_check.fish" "Config check script"

    # DMS sub-configs
    mkdir_p "$target_dir/dms"
    deploy_file "$ASSETS_DIR/mango/dms/layout.conf" "$target_dir/dms/layout.conf" "DMS layout"
    deploy_file "$ASSETS_DIR/mango/dms/colors.conf" "$target_dir/dms/colors.conf" "DMS colors"
    deploy_file "$ASSETS_DIR/mango/dms/outputs.conf" "$target_dir/dms/outputs.conf" "DMS outputs"
    deploy_file "$ASSETS_DIR/mango/dms/windowrules.conf" "$target_dir/dms/windowrules.conf" "DMS window rules"
    deploy_file "$ASSETS_DIR/mango/dms/input.conf" "$target_dir/dms/input.conf" "DMS input"
    deploy_file "$ASSETS_DIR/mango/dms/cursor.conf" "$target_dir/dms/cursor.conf" "DMS cursor"

    # Make scripts executable
    if test "$DRY_RUN" != "true"
        chmod +x "$target_dir/autostart.fish"
        chmod +x "$target_dir/scripts/"*.fish
    end

    log_success "MangoWM configuration deployed"
end