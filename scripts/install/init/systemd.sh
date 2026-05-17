#!/usr/bin/env bash

# systemd backend

enable_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then
        systemctl --user enable --now "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to enable user service: ${service}"
    else
        sudo systemctl enable --now "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to enable system service: ${service}"
    fi
}

start_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then
        systemctl --user start "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to start user service: ${service}"
    else
        sudo systemctl start "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to start system service: ${service}"
    fi
}

restart_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then
        systemctl --user restart "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to restart user service: ${service}"
    else
        sudo systemctl restart "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to restart system service: ${service}"
    fi
}

stop_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then
        systemctl --user stop "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to stop user service: ${service}"
    else
        sudo systemctl stop "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to stop system service: ${service}"
    fi
}
