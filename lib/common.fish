#!/usr/bin/env fish
# Common functions for system-setup

# Colors for output
set -g COLOR_RESET '\033[0m'
set -g COLOR_RED '\033[0;31m'
set -g COLOR_GREEN '\033[0;32m'
set -g COLOR_YELLOW '\033[1;33m'
set -g COLOR_BLUE '\033[0;34m'
set -g COLOR_CYAN '\033[0;36m'

function log_info
    echo -e "$COLOR_BLUE[INFO]$COLOR_RESET $argv"
end

function log_success
    echo -e "$COLOR_GREEN[OK]$COLOR_RESET $argv"
end

function log_warn
    echo -e "$COLOR_YELLOW[WARN]$COLOR_RESET $argv"
end

function log_error
    echo -e "$COLOR_RED[ERROR]$COLOR_RESET $argv"
end

function log_step
    echo -e "$COLOR_CYAN>>>$COLOR_RESET $argv"
end

# Check if command exists
function have_cmd
    command -q $argv[1]
end

# Run command with dry-run support
function run_cmd
    if test "$DRY_RUN" = "true"
        echo "  [DRY RUN] $argv"
        return 0
    end
    eval $argv
end

# Create directory with parents
function mkdir_p
    run_cmd mkdir -p $argv
end

# Copy file with backup
function deploy_file
    set -l src $argv[1]
    set -l dst $argv[2]
    set -l desc $argv[3]

    if test ! -f "$src"
        log_error "Source not found: $src"
        return 1
    end

    mkdir_p (dirname "$dst")

    if test -f "$dst"
        if test "$DRY_RUN" = "true"
            log_info "Would update: $dst"
        else
            cp "$dst" "$dst.backup.$(date +%s)"
            cp "$src" "$dst"
            log_success "Updated: $dst"
        end
    else
        if test "$DRY_RUN" = "true"
            log_info "Would create: $dst"
        else
            cp "$src" "$dst"
            log_success "Created: $dst"
        end
    end
end

# Deploy directory recursively
function deploy_dir
    set -l src $argv[1]
    set -l dst $argv[2]

    if test ! -d "$src"
        log_error "Source dir not found: $src"
        return 1
    end

    mkdir_p "$dst"

    if test "$DRY_RUN" = "true"
        log_info "Would sync: $src -> $dst"
    else
        rsync -a --delete "$src/" "$dst/"
        log_success "Synced: $dst"
    end
end

# Install packages via paru
function install_paru_packages
    set -l pkgs $argv

    if test "$DRY_RUN" = "true"
        for pkg in $pkgs
            echo "  [DRY RUN] paru -S --needed --noconfirm $pkg"
        end
        return 0
    end

    if test (count $pkgs) -eq 0
        return 0
    end

    log_step "Installing $(count $pkgs) packages via paru..."
    paru -S --needed --noconfirm $pkgs
end

# Check if package is installed
function pkg_installed
    pacman -Q $argv[1] >/dev/null 2>&1
end

# Enable and start systemd user service
function enable_user_service
    set -l service $argv[1]

    if test "$DRY_RUN" = "true"
        echo "  [DRY RUN] systemctl --user enable --now $service"
        return 0
    end

    systemctl --user enable --now "$service" 2>/dev/null
    if test $status -eq 0
        log_success "Enabled service: $service"
    else
        log_warn "Failed to enable service: $service"
    end
end

# Create symlink
function link_file
    set -l src $argv[1]
    set -l dst $argv[2]

    mkdir_p (dirname "$dst")

    if test "$DRY_RUN" = "true"
        echo "  [DRY RUN] ln -sf $src $dst"
        return 0
    end

    if test -L "$dst"
        set -l target (readlink "$dst")
        if test "$target" = "$src"
            log_info "Link exists: $dst -> $src"
            return 0
        end
    end

    ln -sf "$src" "$dst"
    log_success "Linked: $dst -> $src"
end