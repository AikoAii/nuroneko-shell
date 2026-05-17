-- ███╗   ███╗ ██████╗ ███╗   ██╗██╗████████╗ ██████╗ ██████╗ ███████╗
-- ████╗ ████║██╔═══██╗████╗  ██║██║╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
-- ██╔████╔██║██║   ██║██╔██╗ ██║██║   ██║   ██║   ██║██████╔╝███████╗
-- ██║╚██╔╝██║██║   ██║██║╚██╗██║██║   ██║   ██║   ██║██╔══██╗╚════██║
-- ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║   ██║   ╚██████╔╝██║  ██║███████║
-- ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
--------------------------------------------------------------------------

-- Default (all monitors)
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

----------------------------
-- OPTIONAL (UNCOMMENT IF NEEDED)
----------------------------

-- High refresh rate monitor
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@144", position = "0x0", scale = 1 })

-- Laptop + external monitor
-- hl.monitor({ output = "eDP-1",    mode = "1920x1080@60",  position = "0x0",    scale = 1 })
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@144", position = "1920x0", scale = 1 })

-- HiDPI scaling
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1.5 })
