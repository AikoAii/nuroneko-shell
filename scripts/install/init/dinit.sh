#!/usr/bin/env bash

# dinit backend

enable_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then

        if command -v dinitctl >/dev/null 2>&1 && dinitctl --user list >/dev/null 2>&1; then

            dinitctl --user enable "${service}" \
                >/dev/null 2>&1 \
                || warn "Failed to enable dinit user service: ${service}"

            dinitctl --user start "${service}" \
                >/dev/null 2>&1 \
                || warn "Failed to start dinit user service: ${service}"

        else
            warn "User-level dinit not fully configured."
            warn "Enabling ${service} system-wide instead."

            sudo dinitctl enable "${service}" \
                >/dev/null 2>&1 \
                || warn "Failed to enable dinit service: ${service}"

            sudo dinitctl start "${service}" \
                >/dev/null 2>&1 \
                || warn "Failed to start dinit service: ${service}"
        fi

    else

        sudo dinitctl enable "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to enable dinit service: ${service}"

        sudo dinitctl start "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to start dinit service: ${service}"
    fi
}

start_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]] && dinitctl --user list >/dev/null 2>&1; then

        dinitctl --user start "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to start dinit user service: ${service}"

    else

        sudo dinitctl start "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to start dinit service: ${service}"
    fi
}

restart_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]] && dinitctl --user list >/dev/null 2>&1; then

        dinitctl --user restart "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to restart dinit user service: ${service}"

    else

        sudo dinitctl restart "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to restart dinit service: ${service}"
    fi
}

stop_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]] && dinitctl --user list >/dev/null 2>&1; then

        dinitctl --user stop "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to stop dinit user service: ${service}"

    else

        sudo dinitctl stop "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to stop dinit service: ${service}"
    fi
}
