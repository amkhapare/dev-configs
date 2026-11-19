-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "tokyonight-night"

-- brew install font-fira-code-nerd-font
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12

config.enable_tab_bar = false

config.keys = {
    {
        key = "Enter",
        mods = "SHIFT",
        action = wezterm.action.SendString("\x1b[200~\n\x1b[201~"),
    },
}


local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
