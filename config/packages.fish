#!/usr/bin/env fish
# Package installation for system-setup
# Run with: source config/packages.fish; install_packages

function install_packages
    # Core WM/DE
    set -l core_pkgs \
        mangowm \
        dms \
        xdg-desktop-portal-wlr \
        wlr-randr \
        swayosd \
        swayosd-client \
        swaync \
        libnotify \
        dunst

    # Terminals
    set -l term_pkgs \
        ghostty \
        alacritty \
        kitty \
        foot

    # Launchers/Menu
    set -l launcher_pkgs \
        fuzzel \
        rofi-wayland \
        wofi

    # Shell
    set -l shell_pkgs \
        fish \
        starship \
        zoxide \
        fd \
        ripgrep \
        bat \
        eza \
        btop \
        htop \
        jq \
        yq

    # Editor
    set -l editor_pkgs \
        neovim \
        lazygit \
        lazydocker

    # File management
    set -l file_pkgs \
        yazi \
        thunar \
        gvfs \
        gvfs-mtp \
        udiskie \
        udisks2 \
        wl-clipboard \
        wl-clip-persist \
        cliphist

    # Network/Bluetooth
    set -l net_pkgs \
        networkmanager \
        network-manager-applet \
        bluez \
        bluez-utils \
        blueman \
        blueman-applet

    # Polkit
    set -l polkit_pkgs \
        xfce-polkit \
        hyprpolkitagent \
        polkit-gnome

    # Fonts
    set -l font_pkgs \
        ttf-jetbrains-mono-nerd \
        ttf-firacode-nerd \
        noto-fonts \
        noto-fonts-emoji \
        noto-fonts-cjk \
        ttf-font-awesome \
        ttf-nerd-fonts-symbols \
        bibata-cursor-theme \
        adw-gtk-theme

    # Audio
    set -l audio_pkgs \
        pipewire \
        pipewire-pulse \
        pipewire-alsa \
        pipewire-jack \
        wireplumber \
        pavucontrol \
        pamixer \
        brightnessctl

    # Screenshots/Recording
    set -l media_pkgs \
        grim \
        slurp \
        swappy \
        wf-recorder \
        obs-studio \
        flameshot

    # Development tools
    set -l dev_pkgs \
        git \
        github-cli \
        docker \
        docker-compose \
        nodejs \
        npm \
        pnpm \
        yarn \
        python \
        python-pip \
        python-pipx \
        go \
        rustup \
        lua \
        luajit \
        luarocks \
        stylua \
        shfmt \
        shellcheck \
        hadolint \
        markdownlint-cli \
        prettier \
        eslint \
        typescript-language-server \
        vscode-langservers-extracted \
        pyright \
        ruff \
        gopls \
        rust-analyzer \
        lua-language-server \
        bash-language-server \
        yaml-language-server \
        dockerfile-language-server \
        json-language-server \
        html-language-server \
        css-language-server \
        tailwindcss-language-server \
        prismals \
        graphql-language-server \
        prisma-language-server \
        svelte-language-server \
        vue-language-server \
        angular-language-server

    # Theming/Color generation
    set -l theme_pkgs \
        matugen \
        wallust \
        imagemagick

    # Misc utilities
    set -l misc_pkgs \
        mpv \
        imv \
        zathura \
        zathura-pdf-mupdf \
        firefox \
        chromium \
        bitwarden \
        keepassxc \
        signal-desktop \
        discord \
        telegram-desktop \
        vesktop \
        steam \
        lutris \
        gamescope \
        mangohud \
        goverlay \
        vkcube \
        vulkan-tools \
        mesa-utils \
        glfw-wayland \
        wayland-protocols

    # AUR packages (need paru)
    set -l aur_pkgs \
        mangowm-git \
        dms-git \
        swayosd-git \
        grimblast-git \
        wlogout \
        wlsunset \
        wob \
        nwg-look \
        nwg-displays \
        nwg-panel \
        nwg-shell \
        nwg-dock-hyprland \
        swww \
        hyprpaper \
        hyprlock \
        hypridle \
        hyprpicker \
        hyprshot \
        hyprland-qtutils \
        hyprland-qt-support \
        qt5-wayland \
        qt6-wayland \
        qt5ct \
        qt6ct \
        kvantum \
        kvantum-qt5 \
        bibata-cursor-theme-git \
        catppuccin-gtk-theme-mocha \
        adw-gtk3 \
        google-chrome \
        visual-studio-code-bin \
        cursor-bin \
        postman-bin \
        insomnia-bin \
        teamviewer \
        anydesk \
        zoom \
        slack-desktop \
        notion-app-enhanced \
        obsidian \
        typora \
        marktext \
        zed \
        helix \
        kakoune \
        micro \
        amp \
        Teodoro \
        tte \
        broot \
        dua-cli \
        dust \
        procs \
        sd \
        tokei \
        hyperfine \
        just \
        cargo-watch \
        cargo-edit \
        cargo-expand \
        cargo-tree \
        cargo-outdated \
        cargo-audit \
        cargo-deny \
        cargo-udeps \
        cargo-machete \
        cargo-nextest \
        cargo-llvm-cov \
        cargo-tarpaulin \
        cargo-flamegraph \
        cargo-profiler \
        cargo-generate \
        cargo-init \
        cargo-new \
        cargo-add \
        cargo-rm \
        cargo-upgrade \
        cargo-outdated \
        cargo-audit \
        cargo-deny \
        cargo-udeps \
        cargo-machete \
        cargo-nextest \
        cargo-llvm-cov \
        cargo-tarpaulin \
        cargo-flamegraph \
        cargo-profiler

    # Combine all packages
    set -l all_pkgs $core_pkgs $term_pkgs $launcher_pkgs $shell_pkgs $editor_pkgs $file_pkgs $net_pkgs $polkit_pkgs $font_pkgs $audio_pkgs $media_pkgs $dev_pkgs $theme_pkgs $misc_pkgs

    # Install via paru
    install_paru_packages $all_pkgs

    # Install AUR packages
    if test "$DRY_RUN" != "true"
        for pkg in $aur_pkgs
            if not pkg_installed $pkg
                log_step "Installing AUR package: $pkg"
                paru -S --needed --noconfirm $pkg
            else
                log_info "Already installed: $pkg"
            end
        end
    else
        for pkg in $aur_pkgs
            echo "  [DRY RUN] paru -S --needed --noconfirm $pkg"
        end
    end

    log_success "All packages installed"
end