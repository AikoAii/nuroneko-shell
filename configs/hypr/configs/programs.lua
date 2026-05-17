-- ██████╗ ██████╗  ██████╗  ██████╗ ██████╗  █████╗ ███╗   ███╗███████╗
-- ██╔══██╗██╔══██╗██╔═══██╗██╔════╝ ██╔══██╗██╔══██╗████╗ ████║██╔════╝
-- ██████╔╝██████╔╝██║   ██║██║  ███╗██████╔╝███████║██╔████╔██║███████╗
-- ██╔═══╝ ██╔══██╗██║   ██║██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║╚════██║
-- ██║     ██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║███████║
-- ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
------------------------------------------------------------------------------
-- Shared program definitions. Used by keybinds.lua and autostart.lua.
-- Usage: local P = require("configs.programs")

local P = {}

----------------------------
---- CORE ------------------
----------------------------
P.terminal    = "kitty"
P.fileManager = "kitty -e yazi"
P.menu        = "fuzzel"

----------------------------
---- BROWSER ---------------
----------------------------
P.browser = "zen-browser"

----------------------------
---- EDITOR / DEV ----------
----------------------------
P.editor     = "code"
P.editor_cli = "nvim"

----------------------------
---- SYSTEM ----------------
----------------------------
P.lock     = "hyprlock"
P.logout   = "hyprctl dispatch exit"
P.shutdown = "loginctl poweroff"
P.reboot   = "loginctl reboot"
P.suspend  = "loginctl suspend && hyprlock"

----------------------------
---- FILE / SYSTEM TOOLS ---
----------------------------
P.explorer    = "nemo"
P.archive     = "file-roller"
P.terminal_fm = "ranger"

----------------------------
---- MEDIA -----------------
----------------------------
P.music = "spotify"
P.video = "mpv"
P.image = "imv"

----------------------------
---- NETWORK / BLUETOOTH ---
----------------------------
P.wifi      = "nm-connection-editor"
P.bluetooth = "blueman-manager"

----------------------------
---- UTILITY ---------------
----------------------------
P.calculator = "qalculate-qt"
P.notes      = "obsidian"
P.monitor    = "btop"
P.process    = "kitty -e btop"

----------------------------
---- SCREENSHOT / RECORD ---
----------------------------
P.screenshot = "flameshot gui"
P.record     = "wf-recorder"

----------------------------
---- CLIPBOARD -------------
----------------------------
P.clipboard = "cliphist list | rofi -dmenu | cliphist decode | wl-copy"

----------------------------
---- POWER MENU ------------
----------------------------
P.powermenu = "wlogout"

return P
