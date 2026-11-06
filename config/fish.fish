#!/usr/bin/env fish
# Fish shell configuration deployment

function deploy_fish_config
    set -l target_dir "$HOME/.config/fish"
    mkdir_p "$target_dir"

    # Main config
    deploy_file "$ASSETS_DIR/fish/config.fish" "$target_dir/config.fish" "Fish config"

    # Completions
    mkdir_p "$target_dir/completions"
    deploy_file "$ASSETS_DIR/fish/completions/hermes.fish" "$target_dir/completions/hermes.fish" "Hermes completions"
    deploy_file "$ASSETS_DIR/fish/completions/hermes-agent.fish" "$target_dir/completions/hermes-agent.fish" "Hermes-agent completions"
    deploy_file "$ASSETS_DIR/fish/completions/herdr.fish" "$target_dir/completions/herdr.fish" "Herdr completions"
    deploy_file "$ASSETS_DIR/fish/completions/paru.fish" "$target_dir/completions/paru.fish" "Paru completions"

    # Functions directory
    mkdir_p "$target_dir/functions"
    deploy_file "$ASSETS_DIR/fish/functions/hprof.fish" "$target_dir/functions/hprof.fish" "hprof function"

    log_success "Fish configuration deployed"
end