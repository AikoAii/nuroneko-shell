--  █████╗ ██████╗ ██████╗ ███████╗ █████╗ ██████╗  █████╗ ███╗   ██╗ ██████╗███████╗
-- ██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝
-- ███████║██████╔╝██████╔╝█████╗  ███████║██████╔╝███████║██╔██╗ ██║██║     █████╗
-- ██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██║██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══╝
-- ██║  ██║██║     ██║     ███████╗██║  ██║██║  ██║██║  ██║██║ ╚████║╚██████╗███████╗
-- ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝
--------------------------------------------------------------------------------------------

----------------------------
---- GENERAL + DECORATION --
----------------------------
hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 2,

        col = {
            active_border   = { colors = { "rgb(b4befe)", "rgb(f5c2e7)" }, angle = 45 },
            inactive_border = "rgba(585b7088)",
        },

        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
--         no_gaps_when_only = true
    },

    decoration = {
        rounding    = 12,
        dim_special = 0.2,
        
        dim_inactive = true,
        dim_strength = 0.05,

        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
            xray    = false,
            new_optimizations = true,
        },
        
        shadow = {
        enabled = true,

        range = 10,
        render_power = 2,

        color = "rgba(00000033)",
       },
    },
})


----------------------------
---- ANIMATIONS ------------
----------------------------

animations = {
    enabled = true,
}

hl.curve("smoothOut", {
    type = "bezier",
    points = {
        { 0.22, 1 },
        { 0.36, 1 },
    }
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
    style = "slide"
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
    style = "popin 85%"
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
    style = "slide"
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 2,
    bezier = "smoothOut"
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
    style = "slidefade"
})
