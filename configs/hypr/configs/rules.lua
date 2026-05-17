-- ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗██████╗ ██╗   ██╗██╗     ███████╗
-- ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔══██╗██║   ██║██║     ██╔════╝
-- ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║██████╔╝██║   ██║██║     █████╗
-- ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║██╔══██╗██║   ██║██║     ██╔══╝
-- ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝██║  ██║╚██████╔╝███████╗███████╗
--  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝
---------------------------------------------------------------------------------------------


-- =========================================================
-- CORE BEHAVIOR
-- =========================================================

-- Disable maximize for all windows (tiling friendly)
hl.window_rule({
    name  = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix XWayland drag issues
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Disable blur on xwayland floating windows
hl.window_rule({
    name  = "no-blur-xwayland-float",
    match = { xwayland = true, float = true },
    no_blur = true,
})


-- =========================================================
-- OPACITY
-- =========================================================

-- Default opacity for all windows
-- hl.window_rule({
--     name    = "default-opacity",
--     match   = { class = "^(.*)$" },
--     opacity = "0.9 0.9",
-- })

-- Full opacity for browsers
hl.window_rule({
    name    = "browser-full-opacity",
    match   = { class = "^(zen-browser|firefox|chromium|brave)$" },
    opacity = "1.0 1.0",
})

-- Slight transparency for file manager
hl.window_rule({
    name    = "nemo-opacity",
    match   = { class = "^(nemo)$" },
    opacity = "0.88 0.88",
})


-- =========================================================
-- PICTURE-IN-PICTURE
-- =========================================================
hl.window_rule({
    name  = "pip",
    match = { title = "(?i)picture[-\\s]?in[-\\s]?picture" },

    float             = true,
    pin               = true,
    keep_aspect_ratio = true,

    move = { "(monitor_w*0.75)", "(monitor_h*0.75)" },
    size = { "(monitor_w*0.25)", "(monitor_h*0.25)" },
})


-- =========================================================
-- FLOATING APPS
-- =========================================================

-- Utilities — float only
hl.window_rule({
    name  = "float-utilities",
    match = { class = "^(blueman-manager|nm-connection-editor|qalculate-qt|file-roller|qt5ct|qt6ct|org.kde.polkit-kde-authentication-agent-1)$" },
    float = true,
})

-- Centered utilities — float + center + size
hl.window_rule({
    name  = "float-centered-utilities",
    match = { class = "^(qalculate-qt|file-roller)$" },
    float  = true,
    center = true,
    size   = { "(monitor_w*0.55)", "(monitor_h*0.65)" },
})

-- Audio control
hl.window_rule({
    name  = "float-audio-control",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
    size  = { "(monitor_w*0.48)", "(monitor_h*0.42)" },
})

hl.window_rule({
    name = "center-floating-windows",

    match = {
        float = true,
        xwayland = false,
    },

    center = true,
})

hl.window_rule({
    name = "float-file-operations",

    match = {
        title = "^(File Upload|File Operation Progress|Confirm to replace files)$"
    },

    float = true,
    center = true,
})


-- =========================================================
-- DIALOGS
-- =========================================================
hl.window_rule({
    name  = "float-dialog-title",
    match = { title = "^(Open|Save As|Authentication Required|Choose Files|Open File)$" },
    float = true,
})

hl.window_rule({
    name  = "float-dialog-title-generic",
    match = { title = "^(.*dialog.*)$" },
    float = true,
})

hl.window_rule({
    name  = "float-dialog-class",
    match = { class = "^(.*dialog.*)$" },
    float = true,
})


-- =========================================================
-- IDLE INHIBIT
-- =========================================================

-- Video players
hl.window_rule({
    name  = "idle-inhibit-video",
    match = { class = "^(mpv|vlc|celluloid)$" },
    idle_inhibit = "fullscreen",
})

-- Browsers (fullscreen video)
hl.window_rule({
    name  = "idle-inhibit-browser",
    match = { class = "^(zen-browser|firefox|chromium|brave)$" },
    idle_inhibit = "fullscreen",
})


-- =========================================================
-- PORTAL (File Picker Fix)
-- =========================================================
hl.window_rule({
    name   = "float-portal",
    match  = { class = "^(org.freedesktop.impl.portal.desktop.hyprland|org.freedesktop.impl.portal.desktop.gtk|xdg-desktop-portal-gtk)$" },
    float  = true,
    center = true,
})


-- =========================================================
-- SPECIAL APPS
-- =========================================================

-- Firefox PiP fallback
hl.window_rule({
    name  = "firefox-pip",
    match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
    float = true,
})

-- btop popup
hl.window_rule({
    name     = "btop-popup",
    match    = { class = "^(btop-popup)$" },
    float    = true,
    center   = true,
    size     = { "(monitor_w*0.6)", "(monitor_h*0.7)" },
    rounding = 12,
    opacity = "0.95 0.95",
})

-- fastfetch popup
hl.window_rule({
    name    = "fastfetch-popup",
    match   = { class = "^(fastfetch-popup)$" },
    float   = true,
    center  = true,
    no_blur = true,
    opacity = "1.0 1.0",
})


-- =========================================================
-- LAYER RULES
-- =========================================================

-- Fuzzel blur
hl.layer_rule({
    name  = "fuzzel-blur",
    match = { namespace = "fuzzel" },
    blur         = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "notifications-blur",

    match = {
        namespace = "notifications"
    },

    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name = "swaync-control-center",

    match = {
        namespace = "swaync-control-center"
    },

    blur = true,
    ignore_alpha = 0,
})

-- =========================================================
-- SCRATCHPAD TERMINAL UI
-- =========================================================

hl.window_rule({
    match = {
        class = "^(scratchpad)$",
    },

    float = false,
})

hl.window_rule({
    name = "calculator-ui",

    match = {
        class = "^(qalculate-qt|gnome-calculator)$"
    },

    float = true,
    center = true,

    size = {
        "(monitor_w*0.22)",
        "(monitor_h*0.55)"
    },
})

hl.window_rule({
    name = "archive-ui",

    match = {
        class = "^(file-roller|org.gnome.FileRoller)$"
    },

    float = true,
    center = true,

    size = {
        "(monitor_w*0.60)",
        "(monitor_h*0.72)"
    },
})

hl.window_rule({
    name = "settings-ui",

    match = {
        class = "^(qt5ct|qt6ct|nwg-look)$"
    },

    float = true,
    center = true,

    size = {
        "(monitor_w*0.55)",
        "(monitor_h*0.70)"
    },
})

hl.window_rule({
    name = "dialog-polish",

    match = {
        class = "^(xdg-desktop-portal-gtk)$"
    },

    float = true,
    center = true,

    size = {
        "(monitor_w*0.45)",
        "(monitor_h*0.55)"
    },
})

hl.window_rule({
    match = {
        class = "com.saivert.pwvucontrol"
    },

    float = true,
    center = true,

    size = { 900, 700 }
})

