#!/usr/bin/env fish
# Neovim configuration deployment

function deploy_nvim_config
    set -l target_dir "$HOME/.config/nvim"
    mkdir_p "$target_dir"
    mkdir_p "$target_dir/lua/config"
    mkdir_p "$target_dir/lua/plugins"
    mkdir_p "$target_dir/lua/lsp"
    mkdir_p "$target_dir/lua/markdown"
    mkdir_p "$target_dir/templates"

    deploy_file "$ASSETS_DIR/nvim/init.lua" "$target_dir/init.lua" "Neovim init"
    deploy_file "$ASSETS_DIR/nvim/lua/config/options.lua" "$target_dir/lua/config/options.lua" "Neovim options"
    deploy_file "$ASSETS_DIR/nvim/lua/config/keymaps.lua" "$target_dir/lua/config/keymaps.lua" "Neovim keymaps"
    deploy_file "$ASSETS_DIR/nvim/lua/config/autocmds.lua" "$target_dir/lua/config/autocmds.lua" "Neovim autocmds"
    deploy_file "$ASSETS_DIR/nvim/lua/config/lazy.lua" "$target_dir/lua/config/lazy.lua" "Neovim lazy setup"
    deploy_file "$ASSETS_DIR/nvim/lua/plugins/plugins.lua" "$target_dir/lua/plugins/plugins.lua" "Neovim plugins"
    deploy_file "$ASSETS_DIR/nvim/lua/lsp/config.lua" "$target_dir/lua/lsp/config.lua" "Neovim LSP config"
    deploy_file "$ASSETS_DIR/nvim/lua/lsp/capabilities.lua" "$target_dir/lua/lsp/capabilities.lua" "Neovim LSP capabilities"
    deploy_file "$ASSETS_DIR/nvim/lua/utils.lua" "$target_dir/lua/utils.lua" "Neovim utils"

    log_success "Neovim configuration deployed"
end