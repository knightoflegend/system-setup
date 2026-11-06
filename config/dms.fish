#!/usr/bin/env fish
# DMS configuration deployment

function deploy_dms_config
    set -l target_dir "$HOME/.config/DankMaterialShell"
    mkdir_p "$target_dir"

    # Main settings
    deploy_file "$ASSETS_DIR/dms/settings.json" "$target_dir/settings.json" "DMS settings"

    # Themes
    mkdir_p "$target_dir/themes"
    deploy_dir "$ASSETS_DIR/themes/astralJourney/" "$target_dir/themes/astralJourney/"

    log_success "DMS configuration deployed"
end