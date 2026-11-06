#!/usr/bin/env fish
# Alacritty configuration deployment

function deploy_alacritty_config
    set -l target_dir "$HOME/.config/alacritty"
    mkdir_p "$target_dir"

    deploy_file "$ASSETS_DIR/alacritty/dank-theme.toml" "$target_dir/dank-theme.toml" "Alacritty theme"

    log_success "Alacritty configuration deployed"
end