#!/usr/bin/env fish
# system-setup - Complete system configuration for Arch/CachyOS with DMS + MangoWM
# Usage: ./install.fish [--dry-run] [--skip-packages] [--only <component>]

set -l SCRIPT_DIR (dirname (realpath $0))
set -l CONFIG_DIR "$SCRIPT_DIR/config"
set -l ASSETS_DIR "$SCRIPT_DIR/assets"
set -l LIB_DIR "$SCRIPT_DIR/lib"

# Load shared functions
source "$LIB_DIR/common.fish"
source "$LIB_DIR/deploy.fish"

# Parse arguments
set -l DRY_RUN false
set -l SKIP_PACKAGES false
set -l ONLY_COMPONENT ""

for arg in $argv
    switch $arg
        case --dry-run
            set DRY_RUN true
        case --skip-packages
            set SKIP_PACKAGES true
        case --only=*
            set ONLY_COMPONENT (string replace '--only=' '' $arg)
        case '--only'
            set ONLY_COMPONENT (argv 1)
            set argv $argv[2..-1]
        case '*'
            echo "Unknown argument: $arg"
            exit 1
    end
end

function print_usage
    echo "system-setup - Deploy complete system configuration"
    echo ""
    echo "Usage: ./install.fish [options]"
    echo ""
    echo "Options:"
    echo "  --dry-run         Show what would be done without making changes"
    echo "  --skip-packages   Skip package installation"
    echo "  --only <component>  Only deploy specific component"
    echo "                      (packages, fish, dms, mango, alacritty, ghostty, fuzzel, nvim, matugen, scripts, wallpapers, services)"
    echo "  --help            Show this help"
end

if test "$argv[1]" = "--help" -o "$argv[1]" = "-h"
    print_usage
    exit 0
end

echo "=========================================="
echo "  System Setup - Arch/CachyOS + DMS/Mango"
echo "=========================================="
echo ""

if test "$DRY_RUN" = "true"
    echo "[DRY RUN] No changes will be made"
    echo ""
end

# Component deployment functions
function deploy_packages
    if test "$SKIP_PACKAGES" = "true"
        echo "[SKIP] Package installation (--skip-packages)"
        return
    end
    echo ">>> Installing packages..."
    source "$CONFIG_DIR/packages.fish"
    install_packages
end

function deploy_fish
    echo ">>> Deploying Fish shell configuration..."
    source "$CONFIG_DIR/fish.fish"
    deploy_fish_config
end

function deploy_dms
    echo ">>> Deploying DMS configuration..."
    source "$CONFIG_DIR/dms.fish"
    deploy_dms_config
end

function deploy_mango
    echo ">>> Deploying MangoWM configuration..."
    source "$CONFIG_DIR/mango.fish"
    deploy_mango_config
end

function deploy_alacritty
    echo ">>> Deploying Alacritty configuration..."
    source "$CONFIG_DIR/alacritty.fish"
    deploy_alacritty_config
end

function deploy_ghostty
    echo ">>> Deploying Ghostty configuration..."
    source "$CONFIG_DIR/ghostty.fish"
    deploy_ghostty_config
end

function deploy_fuzzel
    echo ">>> Deploying Fuzzel configuration..."
    source "$CONFIG_DIR/fuzzel.fish"
    deploy_fuzzel_config
end

function deploy_nvim
    echo ">>> Deploying Neovim configuration..."
    source "$CONFIG_DIR/nvim.fish"
    deploy_nvim_config
end

function deploy_matugen
    echo ">>> Deploying Matugen configuration..."
    source "$CONFIG_DIR/matugen.fish"
    deploy_matugen_config
end

function deploy_scripts
    echo ">>> Deploying Mango scripts..."
    source "$CONFIG_DIR/scripts.fish"
    deploy_scripts_config
end

function deploy_wallpapers
    echo ">>> Deploying wallpapers..."
    source "$CONFIG_DIR/wallpapers.fish"
    deploy_wallpapers_config
end

function deploy_services
    echo ">>> Configuring systemd user services..."
    source "$CONFIG_DIR/services.fish"
    deploy_services_config
end

# Component list in dependency order
set -l components packages fish dms mango alacritty ghostty fuzzel nvim matugen scripts wallpapers services

if test -n "$ONLY_COMPONENT"
    if not contains $ONLY_COMPONENT $components
        echo "Error: Unknown component '$ONLY_COMPONENT'"
        echo "Valid components: $components"
        exit 1
    end
    echo ">>> Deploying only: $ONLY_COMPONENT"
    deploy_$ONLY_COMPONENT
else
    for component in $components
        deploy_$component
    end
end

echo ""
echo "=========================================="
echo "  Setup complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "  1. Log out and log back in (or reboot)"
echo "  2. Select 'MangoWM' or 'DMS' at login"
echo "  3. Run 'dms' to start the shell if needed"
echo "  4. Run 'matugen image <wallpaper>' to generate colors"
echo ""
echo "Key bindings (Super = Windows key):"
echo "  Super+Return     Open Ghostty"
echo "  Super+Space      Fuzzel launcher"
echo "  Super+h/j/k/l    Focus windows"
echo "  Super+Shift+h/j/k/l  Swap windows"
echo "  Super+1-9        Switch tags"
echo "  Super+Shift+1-9  Move window to tag"
echo "  Super+Shift+Escape  Lock screen"
echo "  Print            Screenshot"
echo "  XF86 keys        Volume/brightness"