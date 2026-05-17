-- ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ██╗███╗   ██╗ ██████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║
-- ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝
-------------------------------------------------------------------------------------

local P = require("configs.programs")
local M = "SUPER"

-- =========================================================
-- CORE WINDOW CONTROL
-- =========================================================
hl.bind(M .. " + Q", hl.dsp.window.close()) -- Kill active window

hl.bind(M .. " + SPACE", function()
	hl.dispatch(hl.dsp.window.float())

	hl.dispatch(hl.dsp.window.resize({
		x = 1200,
		y = 800,
	}))

	hl.dispatch(hl.dsp.window.center())
end)

hl.bind("ALT + RETURN", hl.dsp.window.fullscreen()) -- Toggle fullscreen
hl.bind(M .. " + P", hl.dsp.window.pseudo()) -- Pseudo tiling
hl.bind(M .. " + J", hl.dsp.layout("togglesplit")) -- Toggle split (dwindle)

-- =========================================================
-- APPLICATION LAUNCHERS
-- =========================================================
hl.bind(M .. " + RETURN", hl.dsp.exec_cmd(P.terminal)) -- Terminal
hl.bind(M .. " + D", hl.dsp.exec_cmd(P.menu)) -- App launcher
hl.bind(M .. " + Z", hl.dsp.exec_cmd(P.browser)) -- Browser
hl.bind(M .. " + E", hl.dsp.exec_cmd(P.explorer)) -- File manager (GUI)

-- Utilities
hl.bind(M .. " + C", hl.dsp.exec_cmd(P.editor)) -- VSCode
hl.bind(M .. " + I", hl.dsp.exec_cmd(P.notes)) -- Notes (Obsidian)

-- =========================================================
-- WALLPAPER CONTROL
-- =========================================================

hl.bind(
    M .. " + W",
    hl.dsp.exec_cmd("~/.local/bin/wallpaper-select")
)

hl.bind(
    M .. " + SHIFT + W",
    hl.dsp.exec_cmd("~/.local/bin/wallpaper-random")
)

hl.bind(
    M .. " + CTRL + W",
    hl.dsp.exec_cmd("~/.local/bin/wallpaper-set ~/.local/share/wallpapers/current")
)

-- =========================================================
-- CLIPBOARD MANAGEMENT
-- =========================================================

-- Clipboard history picker
hl.bind(
    M .. " + V",
    hl.dsp.exec_cmd(
        "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
    )
)

-- Clear clipboard history
hl.bind(
    M .. " + SHIFT + V",
    hl.dsp.exec_cmd(
        "cliphist wipe && notify-send 'Clipboard' 'History cleared'"
    )
)
-- =========================================================
-- SCREENSHOT SYSTEM
-- =========================================================
-- Core modes
hl.bind("Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh full"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh region"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh copy"))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh both"))

-- Smart screenshot
hl.bind(M .. " + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh smart"))
hl.bind(M .. " + SHIFT + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh smart-both"))
hl.bind(M .. " + CTRL + Print", hl.dsp.exec_cmd("~/.local/bin/screenshot.sh smart-copy"))

-- OCR
hl.bind(M .. " + O", hl.dsp.exec_cmd("~/.local/bin/ocr-copy.sh"))

-- =========================================================
-- SYSTEM CONTROL — Power & Session
-- =========================================================
hl.bind(M .. " + L", hl.dsp.exec_cmd(P.lock)) -- Lock screen

hl.bind(M .. " + CTRL + DELETE", hl.dsp.exec_cmd("wlogout --buttons-per-row 3")
) -- Power menu

hl.bind(M .. " + CTRL + R", hl.dsp.exec_cmd("hyprctl reload")) -- Reload config

-- =========================================================
-- UI TOGGLES
-- =========================================================
-- hl.bind(M .. " + TAB", hl.dsp.exec_cmd(P.fileManager)) -- Quick file manager (CLI)
hl.bind(M .. " + B", hl.dsp.exec_cmd("killall waybar || waybar")) -- Toggle waybar

-- =========================================================
-- WINDOW FOCUS NAVIGATION
-- =========================================================
hl.bind(M .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(M .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(M .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(M .. " + down", hl.dsp.focus({ direction = "down" }))

-- =========================================================
-- WORKSPACE MANAGEMENT
-- =========================================================
for i = 1, 10 do
	local key = i % 10
	hl.bind(M .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(M .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- =========================================================
-- MOUSE CONTROLS
-- =========================================================
hl.bind(M .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(M .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- LMB → move
hl.bind(M .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- RMB → resize

-- =========================================================
-- MEDIA KEYS — Volume, Brightness, Player
-- =========================================================
-- Volume (with SwayOSD feedback)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+ && swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && swayosd-client --output-volume mute-toggle"),
	{ locked = true, repeating = true }
)

-- Mic
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle && swayosd-client --input-volume mute-toggle"),
	{ locked = true, repeating = true }
)

-- Brightness (with SwayOSD feedback)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+ && swayosd-client --brightness raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%- && swayosd-client --brightness lower"),
	{ locked = true, repeating = true }
)

-- Media player
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- =========================================================
-- EXTRAS — Keybind viewer & Power modes
-- =========================================================
hl.bind(
	M .. " + SLASH",
	hl.dsp.exec_cmd("cat ~/.config/hypr/keybinds_ui.txt | fuzzel --dmenu --prompt '󰌌 Keybinds: '")
)

hl.bind(M .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/save-power.sh"))
hl.bind(M .. " + F2", hl.dsp.exec_cmd("~/.config/hypr/scripts/balance.sh"))
hl.bind(M .. " + F3", hl.dsp.exec_cmd("~/.config/hypr/scripts/daily.sh"))
hl.bind(M .. " + F4", hl.dsp.exec_cmd("~/.config/hypr/scripts/performance.sh"))

-- WINDOW FOCUS NAVIGATION
--------------------------------------------------
-- WINDOW RESIZE
--------------------------------------------------

-- hl.bind(
--     M .. " + SHIFT + RIGHT",
--     hl.dsp.exec_cmd("hyprctl dispatch resizeactive 30 0")
-- )
--
-- hl.bind(
--     M .. " + SHIFT + LEFT",
--     hl.dsp.exec_cmd("hyprctl dispatch resizeactive -30 0")
-- )
--
-- hl.bind(
--     M .. " + SHIFT + UP",
--     hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -30")
-- )
--
-- hl.bind(
--     M .. " + SHIFT + DOWN",
--     hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 30")
-- )

-- SYSTEM CONTROL
--------------------------------------------------
-- POWER CONTROLS
--------------------------------------------------

hl.bind(M .. " + CTRL + SHIFT + L", hl.dsp.exec_cmd(P.lock))

hl.bind(M .. " + CTRL + SHIFT + P", hl.dsp.exec_cmd(P.suspend))

hl.bind(M .. " + CTRL + SHIFT + R", hl.dsp.exec_cmd(P.reboot))

hl.bind(M .. " + CTRL + SHIFT + Q", hl.dsp.exec_cmd(P.logout))

hl.bind(M .. " + CTRL + SHIFT + S", hl.dsp.exec_cmd(P.shutdown))

-- =========================================================
-- SCRATCHPAD (Special Workspace)
-- =========================================================
hl.bind(M .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(M .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(M .. " + T", hl.dsp.exec_cmd("[workspace special:magic] kitty --class scratchpad"))
hl.bind(M .. " + M", hl.dsp.exec_cmd("[workspace special:magic] " .. P.music))

-- =========================================================
-- EMOJI PICKER
-- =========================================================

hl.bind(
    M .. " + PERIOD",
    hl.dsp.exec_cmd(
        "rofimoji --selector rofi --selector-args='-theme ~/.config/rofi/themes/emoji.rasi' --hidden-descriptions"
    )
)

-- =========================================================
-- CALCULATOR
-- =========================================================

-- hl.bind(
--     M .. " + C",
--     hl.dsp.exec_cmd("calc-menu")
-- )

-- =========================================================
-- FILE SEARCH
-- =========================================================

hl.bind(
    M .. " + SHIFT + F",
    hl.dsp.exec_cmd("file-search")
)


hl.bind(
    M .. " + ESCAPE",
    hl.dsp.exec_cmd("powermenu")
)

-- =========================================================
-- NOTIFICATION CENTER
-- =========================================================

-- Toggle control center
hl.bind(
    M .. " + N",
    hl.dsp.exec_cmd("swaync-client -t")
)

-- Close current notification
hl.bind(
    M .. " + SHIFT + N",
    hl.dsp.exec_cmd("swaync-client -cp")
)

-- Clear all notifications
hl.bind(
    M .. " + CTRL + N",
    hl.dsp.exec_cmd("swaync-client -C")
)

-- =========================================================
-- AUDIO CONTROL
-- =========================================================

hl.bind(
    M .. " + A",
    hl.dsp.exec_cmd("pwvucontrol")
)
