-- ███╗   ███╗██╗███████╗ ██████╗
-- ████╗ ████║██║██╔════╝██╔════╝
-- ██╔████╔██║██║███████╗██║
-- ██║╚██╔╝██║██║╚════██║██║
-- ██║ ╚═╝ ██║██║███████║╚██████╗
-- ╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝
------------------------------------

hl.config({
    misc = {
        vrr                        = 0,
        disable_hyprland_logo      = true,
        disable_splash_rendering   = true,
        force_default_wallpaper    = 0,
        anr_missed_pings           = 5,
        allow_session_lock_restore = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
    },
    
    cursor = {
    inactive_timeout = 2,
    hide_on_key_press = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
    
})
