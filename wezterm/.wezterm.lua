local wezterm = require("wezterm")
local theme = require("wezterm-dragon")

local config = wezterm.config_builder()

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

if is_linux() then
	config.dpi = 96
end

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 22

config.colors = theme

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.window_close_confirmation = "NeverPrompt"

-- config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.enable_kitty_graphics = true

return config
