#!/usr/bin/env bash

# runit backend

enable_service() {
    local service="$1"
    local level="${2:-system}"

    if [[ "$level" == "user" ]]; then
        warn "runit does not natively support user services."
        warn "Enabling ${service} system-wide instead."
    fi

    if [[ -d "/etc/sv/${service}" ]]; then

        sudo ln -sf "/etc/sv/${service}" "/var/service/" \
            >/dev/null 2>&1 \
            || warn "Failed to link runit service: ${service}"

        sudo sv start "${service}" \
            >/dev/null 2>&1 \
            || warn "Failed to start runit service: ${service}"

    else
        warn "Service directory /etc/sv/${service} not found."
    fi
}

start_service() {
    local service="$1"

    sudo sv start "${service}" \
        >/dev/null 2>&1 \
        || warn "Failed to start runit service: ${service}"
}

restart_service() {
    local service="$1"

    sudo sv restart "${service}" \
        >/dev/null 2>&1 \
        || warn "Failed to restart runit service: ${service}"
}

stop_service() {
    local service="$1"

    sudo sv stop "${service}" \
        >/dev/null 2>&1 \
        || warn "Failed to stop runit service: ${service}"
}
