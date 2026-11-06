# system-setup

Complete system configuration for Arch/CachyOS with DMS (Dank Material Shell) + MangoWM.

## Overview

This repository contains a complete, reproducible system configuration that mirrors my current setup. It includes:

- **Window Manager**: MangoWM (Wayland compositor) with DMS shell
- **Shell**: Fish with extensive aliases, completions, and Hermes integration
- **Terminals**: Ghostty (primary), Alacritty (themed)
- **Launcher**: Fuzzel with matugen-generated themes
- **Editor**: Neovim with lazy.nvim, LSP, Telescope, Treesitter
- **Theming**: Matugen for wallpaper-based color generation
- **Key Bindings**: Complete vim-style bindings for window management

## Quick Start

```bash
# Clone and run
git clone https://github.com/yourusername/system-setup.git
cd system-setup
./install.fish

# Or dry-run first
./install.fish --dry-run

# Deploy only specific component
./install.fish --only nvim
```

## Components

| Component | Config Location | Description |
|-----------|-----------------|-------------|
| Fish | `~/.config/fish/` | Shell config, aliases, completions |
| DMS | `~/.config/DankMaterialShell/` | Shell settings, themes |
| MangoWM | `~/.config/mango/` | WM config, keybindings, rules, scripts |
| Ghostty | `~/.config/ghostty/` | Terminal config + themes |
| Alacritty | `~/.config/alacritty/` | Terminal theme |
| Fuzzel | `~/.config/fuzzel/` | Launcher config + themes |
| Neovim | `~/.config/nvim/` | Editor config (lazy.nvim) |
| Matugen | `~/.config/matugen/` | Color generation templates |
| Wallpapers | `~/Pictures/wallpapers/` | Background images |

## Key Bindings (Super = Windows/Mod key)

| Binding | Action |
|---------|--------|
| `Super+Return` | Open Ghostty |
| `Super+Ctrl+Return` | Open Ghostty with Yazi |
| `Super+Space` | Fuzzel launcher |
| `Super+Shift+Space` | Fuzzel dmenu |
| `Super+h/j/k/l` | Focus left/down/up/right |
| `Super+Shift+h/j/k/l` | Swap window left/down/up/right |
| `Super+Ctrl+h/j/k/l` | Move floating window |
| `Super+Alt+h/j/k/l` | Resize floating window |
| `Super+1-9` | Switch to tag 1-9 |
| `Super+Shift+1-9` | Move window to tag 1-9 |
| `Super+Ctrl+1-9` | Toggle tag on window |
| `Super+Alt+1-9` | Toggle view tag |
| `Super+f` | Toggle fullscreen |
| `Super+v` | Toggle floating |
| `Super+m` | Toggle maximize |
| `Super+z` | Toggle scratchpad |
| `Super+Shift+Escape` | Lock screen |
| `Print` | Screenshot |
| `Super+Shift+s` | Screenshot (region) |
| `Super+b` | Toggle bar |
| `Super+grave` | Toggle notifications |
| `Super+x` | Power menu |
| `XF86AudioRaise/Lower/Mute` | Volume control |
| `XF86MonBrightnessUp/Down` | Brightness control |

## Requirements

- Arch Linux or CachyOS
- paru (AUR helper)
- Wayland session
- Git

## Post-Install

1. Log out and select "MangoWM" or "DMS" at login
2. Run `matugen image ~/Pictures/wallpapers/tsunami.png` to generate colors
3. Run `dms` if not auto-started
4. Configure GitHub CLI: `gh auth login`

## Structure

```
system-setup/
├── install.fish              # Main entry point
├── config/                   # Component deployment scripts
├── assets/                   # Configuration files
│   ├── fish/                 # Fish shell config
│   ├── dms/                  # DMS settings + themes
│   ├── mango/                # MangoWM config + scripts
│   ├── alacritty/            # Alacritty theme
│   ├── ghostty/              # Ghostty config + themes
│   ├── fuzzel/               # Fuzzel config + themes
│   ├── nvim/                 # Neovim config
│   ├── matugen/              # Matugen templates
│   ├── wallpapers/           # Background images
│   └── services/             # Systemd user services
└── lib/                      # Shared functions
    ├── common.fish           # Logging, utilities
    └── deploy.fish           # Deployment helpers
```

## License

MIT