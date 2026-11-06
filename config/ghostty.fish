#!/usr/bin/env fish
# Ghostty configuration deployment

function deploy_ghostty_config
    set -l target_dir "$HOME/.config/ghostty"
    mkdir_p "$target_dir"
    mkdir_p "$target_dir/themes"

    deploy_file "$ASSETS_DIR/ghostty/config.ghostty" "$target_dir/config.ghostty" "Ghostty config"
    deploy_file "$ASSETS_DIR/ghostty/themes/matugen-theme" "$target_dir/themes/matugen-theme" "Ghostty matugen theme"

    log_success "Ghostty configuration deployed"
end