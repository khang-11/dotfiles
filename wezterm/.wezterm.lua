local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Tokyo Night Storm"
config.font_size = 20
config.enable_tab_bar = false
config.window_padding = {
	left = 30,
	right = 30,
	top = 80,
	bottom = 30,
}
config.font = wezterm.font({
	family = "JetBrains Mono",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.window_decorations = "INTEGRATED_BUTTONS"

local window_opacity = 0.9
config.window_background_opacity = window_opacity
config.macos_window_background_blur = 20

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_opacity == 1.0 then
		overrides.window_background_opacity = window_opacity
	else
		overrides.window_background_opacity = 1.0
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{ key = "t", mods = "CTRL", action = wezterm.action.EmitEvent("toggle-opacity") },
}

return config
