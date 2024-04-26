local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Tokyo Night Storm"
config.font_size = 20
config.enable_tab_bar = false
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 30,
}
config.font = wezterm.font({
	family = "JetBrains Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

return config
