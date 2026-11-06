#!/usr/bin/env fish
# Systemd services deployment

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