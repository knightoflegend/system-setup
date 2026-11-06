source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# ===== CUSTOM ENVIRONMENT CONFIGURATION =====
# Phase 1 Implementation: Shell Environment Setup

# Set Neovim as default editor
set -x EDITOR nvim
set -x VISUAL nvim
set -x SUDO_EDITOR nvim

# Language/Locale settings
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Path additions for local installations
set -x PATH $PATH $HOME/.local/bin

# History settings
set -g fish_history_max 10000
set -g fish_history_format '%Y-%m-%d %H:%M:%S %s'

# Clipboard integration for Neovim
set -gx clipboard "unamedplus"

# Manager configurations
# Fish plugin configurations (manual setup)


# ===== ALIASES =====
# Basic aliases
alias ll='ls -la'
alias la='ls -a'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Neovim shortcuts
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias n='nvim'

# Git shortcuts
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate --all'
alias st='git status'
alias co='git checkout'
alias br='git branch'

# File operations
alias c='cd'
alias l='ls -la'
alias m='mkdir -p'
alias rmf='rm -rf'

# Quick navigation
alias cdh='cd ~'
alias cdd='cd ~/Documents'
alias cdp='cd ~/Projects'
alias cdw='cd ~/Desktop'
alias cdm='cd ~/Music'
alias cdv='cd ~/Videos'
alias cdm='cd ~/Music'
alias cdn='cd ~/Downloads'
alias cdt='cd ~/Templates'
alias cdpf='cd ~/Pictures'

# Quick file operations
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# Search and find
alias find='find . -name'
alias locate='locate'
alias grep='grep --color=auto'

# Neovim specific
alias vconf='nvim ~/.config/nvim/init.lua'
alias fconf='nvim ~/.config/fish/config.fish'
alias tconf='nvim ~/.config/mango/config.conf'
alias gitconf='nvim ~/.gitconfig'
alias bashconf='nvim ~/.bashrc'  # This won't work but shows how it would work

# Show file information
alias fsize='du -sh'
alias fsize2='du -h --max-depth=1'

# ===== HERMES AGENT ALIASES & FUNCTIONS =====
# Short Hermes CLI
alias h='hermes'
alias ha='hermes-agent'
alias hd='herdr'

# Profile switching
function hprof --description 'Switch Hermes profile'
    set -l profiles (ls -1 ~/.hermes/profiles/)
    if test -z "$argv[1]"
        echo "Available profiles:"
        for p in $profiles
            echo "  $p"
        end
        return 1
    end
    if not contains $argv[1] $profiles
        echo "Profile '$argv[1]' not found. Available: $profiles"
        return 1
    end
    set -x HERMES_PROFILE $argv[1]
    echo "Switched to profile: $argv[1]"
end

# Quick profile aliases
alias horch='hprof orchestrator'
alias hcomm='hprof community'
alias hcont='hprof content'
alias hdev='hprof developer'
alias hecom='hprof ecommerce'
alias hanal='hprof analyst'
alias hpart='hprof partnerships'

# Hermes common workflows
alias hchat='hermes chat'
alias hrun='hermes run'
alias hskill='hermes skill'
alias hmem='hermes memory'
alias hconfig='hermes config'
alias hauth='hermes auth'
alias hdoctor='hermes doctor'
alias hupdate='hermes update'

# Delegation shortcuts
alias hspawn='hermes delegate spawn'
alias hlist='hermes delegate list'
alias hstop='hermes delegate stop'

# Skills
alias hsl='hermes skill list'
alias hsv='hermes skill view'
alias hsc='hermes skill create'

# Cron
alias hcron='hermes cronjob'
alias hcronl='hermes cronjob list'
alias hcronc='hermes cronjob create'

# ===== PARU / ARCH SPECIFIC =====
alias parus='paru -S'
alias parusy='paru -Sy'
alias parusyu='paru -Syu'
alias paruss='paru -Ss'
alias paruqi='paru -Qi'
alias paruql='paru -Ql'
alias paruqo='paru -Qo'
alias paruq='paru -Q'
alias paruqm='paru -Qm'  # AUR packages
alias paruqn='paru -Qn'  # Native packages
alias parurs='paru -Rs'
alias parursn='paru -Rns'
alias parusc='paru -Sc'
alias paruscc='paru -Scc'
alias parug='paru -G'    # Get PKGBUILD

# Systemd user services
alias scu='systemctl --user'
alias scust='systemctl --user start'
alias scustp='systemctl --user stop'
alias scure='systemctl --user restart'
alias scuen='systemctl --user enable'
alias scudis='systemctl --user disable'
alias scustatus='systemctl --user status'
alias sculogs='journalctl --user -u'

# CachyOS specific
alias cachyos-update='paru -Syu && cachyos-update-grub'
alias cachyos-kernel='pacman -Q | grep linux-cachyos'

# SSH Agent Configuration
if status is-interactive
    eval (ssh-agent --shell fish)
    ssh-add ~/.ssh/id_ed25519 2>/dev/null || true
end

# Hermes Agent command
fish_add_path "$HOME/.local/bin"

# ===== FISH COMPLETIONS FOR HERMES =====
# Load completions from ~/.config/fish/completions/