#!/usr/bin/env fish
# Wallpapers deployment

function deploy_wallpapers_config
    set -l target_dir "$HOME/Pictures/wallpapers"
    mkdir_p "$target_dir"

    deploy_file "$ASSETS_DIR/wallpapers/tsunami.png" "$target_dir/tsunami.png" "Wallpaper: tsunami"
    deploy_file "$ASSETS_DIR/wallpapers/archbg.png" "$target_dir/archbg.png" "Wallpaper: archbg"
    deploy_file "$ASSETS_DIR/wallpapers/sword.png" "$target_dir/sword.png" "Wallpaper: sword"

    log_success "Wallpapers deployed"
end