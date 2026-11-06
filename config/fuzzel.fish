#!/usr/bin/env fish
# Fuzzel configuration deployment

function deploy_fuzzel_config
    set -l target_dir "$HOME/.config/fuzzel"
    mkdir_p "$target_dir"

    deploy_file "$ASSETS_DIR/fuzzel/fuzzel.ini" "$target_dir/fuzzel.ini" "Fuzzel config"
    deploy_file "$ASSETS_DIR/fuzzel/fuzzel-dankcolors.conf" "$target_dir/fuzzel-dankcolors.conf" "Fuzzel dank colors"
    deploy_file "$ASSETS_DIR/fuzzel/fuzzel-theme.conf" "$target_dir/fuzzel-theme.conf" "Fuzzel matugen theme"

    log_success "Fuzzel configuration deployed"
end