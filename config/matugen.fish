#!/usr/bin/env fish
# Matugen configuration deployment

function deploy_matugen_config
    set -l target_dir "$HOME/.config/matugen"
    mkdir_p "$target_dir"
    mkdir_p "$target_dir/templates"

    deploy_file "$ASSETS_DIR/matugen/config.toml" "$target_dir/config.toml" "Matugen config"
    deploy_file "$ASSETS_DIR/matugen/templates/ghostty.conf" "$target_dir/templates/ghostty.conf" "Matugen ghostty template"
    deploy_file "$ASSETS_DIR/matugen/templates/fuzzel.conf" "$target_dir/templates/fuzzel.conf" "Matugen fuzzel template"

    log_success "Matugen configuration deployed"
end