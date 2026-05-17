#!/usr/bin/env bash

# openrc backend

enable_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then
        warn "OpenRC does not natively support user services."
        warn "Enabling ${service} system-wide instead."
    fi

    sudo rc-update add "${service}" default \
        >/dev/null 2>&1 \
        || warn "Failed to enable OpenRC service: ${service}"

    sudo rc-service "${service}" start \
        >/dev/null 2>&1 \
        || warn "Failed to start OpenRC service: ${service}"
}

start_service() {
    local service="$1"

    sudo rc-service "${service}" start \
        >/dev/null 2>&1 \
        || warn "Failed to start OpenRC service: ${service}"
}

restart_service() {
    local service="$1"

    sudo rc-service "${service}" restart \
        >/dev/null 2>&1 \
        || warn "Failed to restart OpenRC service: ${service}"
}

stop_service() {
    local service="$1"

    sudo rc-service "${service}" stop \
        >/dev/null 2>&1 \
        || warn "Failed to stop OpenRC service: ${service}"
}
