-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
-- ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝
---------------------------------------------------------------------------
-- Hyprland 0.55+ — Lua Configuration
-- Modular layout · Catppuccin aesthetic · Dwindle layout
-- Artix Linux (dinit) · Keyboard-driven workflow
---------------------------------------------------------------------------

----------------------------
---- SESSION ---------------
----------------------------
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

----------------------------
---- MODULES ---------------
----------------------------
-- Each require() runs in its own scope — errors in one
-- module will not prevent others from loading.

require("configs.env")          -- Environment variables (GPU, Wayland, Electron, etc.)
require("configs.monitors")     -- Display configuration
require("configs.input")        -- Keyboard, mouse, touchpad, gestures
require("configs.misc")         -- Misc options, XWayland
require("configs.autostart")    -- Autostart daemons & services
require("configs.appearance")   -- General, decoration, animations
require("configs.layout")       -- Dwindle/master config, workspace rules
require("configs.keybinds")     -- All keybindings
require("configs.rules")        -- Window rules, layer rules

