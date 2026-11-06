#!/usr/bin/env fish
# Deployment helpers for system-setup

# Deploy Fish shell configuration
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

# Deploy DMS configuration
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

# Deploy MangoWM configuration
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

# Deploy Alacritty configuration
function deploy_alacritty_config
    set -l target_dir "$HOME/.config/alacritty"
    mkdir_p "$target_dir"

    deploy_file "$ASSETS_DIR/alacritty/dank-theme.toml" "$target_dir/dank-theme.toml" "Alacritty theme"

    log_success "Alacritty configuration deployed"
end

# Deploy Ghostty configuration
function deploy_ghostty_config
    set -l target_dir "$HOME/.config/ghostty"
    mkdir_p "$target_dir"
    mkdir_p "$target_dir/themes"

    deploy_file "$ASSETS_DIR/ghostty/config.ghostty" "$target_dir/config.ghostty" "Ghostty config"
    deploy_file "$ASSETS_DIR/ghostty/themes/matugen-theme" "$target_dir/themes/matugen-theme" "Ghostty matugen theme"

    log_success "Ghostty configuration deployed"
end

# Deploy Fuzzel configuration
function deploy_fuzzel_config
    set -l target_dir "$HOME/.config/fuzzel"
    mkdir_p "$target_dir"

    deploy_file "$ASSETS_DIR/fuzzel/fuzzel.ini" "$target_dir/fuzzel.ini" "Fuzzel config"
    deploy_file "$ASSETS_DIR/fuzzel/fuzzel-dankcolors.conf" "$target_dir/fuzzel-dankcolors.conf" "Fuzzel dank colors"
    deploy_file "$ASSETS_DIR/fuzzel/fuzzel-theme.conf" "$target_dir/fuzzel-theme.conf" "Fuzzel matugen theme"

    log_success "Fuzzel configuration deployed"
end

# Deploy Neovim configuration
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

# Deploy Matugen configuration
function deploy_matugen_config
    set -l target_dir "$HOME/.config/matugen"
    mkdir_p "$target_dir"
    mkdir_p "$target_dir/templates"

    deploy_file "$ASSETS_DIR/matugen/config.toml" "$target_dir/config.toml" "Matugen config"
    deploy_file "$ASSETS_DIR/matugen/templates/ghostty.conf" "$target_dir/templates/ghostty.conf" "Matugen ghostty template"
    deploy_file "$ASSETS_DIR/matugen/templates/fuzzel.conf" "$target_dir/templates/fuzzel.conf" "Matugen fuzzel template"

    log_success "Matugen configuration deployed"
end

# Deploy Mango scripts
function deploy_scripts_config
    # Already handled in deploy_mango_config
    log_success "Mango scripts deployed (with mango config)"
end

# Deploy wallpapers
function deploy_wallpapers_config
    set -l target_dir "$HOME/Pictures/wallpapers"
    mkdir_p "$target_dir"

    deploy_file "$ASSETS_DIR/wallpapers/tsunami.png" "$target_dir/tsunami.png" "Wallpaper: tsunami"
    deploy_file "$ASSETS_DIR/wallpapers/archbg.png" "$target_dir/archbg.png" "Wallpaper: archbg"
    deploy_file "$ASSETS_DIR/wallpapers/sword.png" "$target_dir/sword.png" "Wallpaper: sword"

    log_success "Wallpapers deployed"
end

# Deploy systemd user services
function deploy_services_config
    set -l services_dir "$HOME/.config/systemd/user"
    mkdir_p "$services_dir"

    # DMS service
    deploy_file "$ASSETS_DIR/services/dms.service" "$services_dir/dms.service" "DMS service"

    # Enable services
    enable_user_service "dms.service"

    # Update environment
    if test "$DRY_RUN" != "true"
        dbus-update-activation-environment --systemd \
            WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE XDG_SESSION_DESKTOP 2>/dev/null || true
    end

    log_success "Systemd services configured"
end