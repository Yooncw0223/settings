-- Get the wezterm APIU
local wezterm = require("wezterm")
-- for i in {1..9}; do gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]";done

-- config table
local config = {}

-- for newer version of wezterm for better error message
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- starting to apply actual settings
-- config.freetype_load_target = "Light"
-- config.font = wezterm.font{ family = 'FiraCode Nerd Font', weight = "Regular"}
-- config.font = wezterm.font{ family = 'JetbrainsMono Nerd Font', weight = "Light"}
config.font = wezterm.font{ family = 'JetbrainsMono Nerd Font', weight = "Light"}
-- config.font = wezterm.font("FantasqueSansM Nerd Font", { weight = "Medium", stretch = "Condensed" })
config.font_rules = {
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font{
      family="FiraCode Nerd Font",
      weight = 'Bold',
      style = 'Italic',
    },
  },
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font{
      family="JetbrainsMono Nerd Font",
      -- family="FantasqueSansM Nerd Font",
      -- family="FiraCode Nerd Font",
      -- family="MesloLGLDZ Nerd Font",
      style = 'Italic',
      -- family="Victor Mono",
      weight = 'Medium',
    },
  }
}

-- config.font = wezterm.font("JetbrainsMono Nerd Font", { weight = "Light", stretch = "Condensed" })
-- config.font = wezterm.font("DroidSansM Nerd Font", { stretch = "Condensed" })
-- config.font = wezterm.font("InconsolataGo Nerd Font")
-- config.font = wezterm.font("MesloLGLDZ Nerd Font")
-- config.font = wezterm.font("BlexMono Nerd Font")

-- config.font_rasterizer = "FreeType"
config.font_size = 10

-- animation; FYI: for settings with GPU
config.animation_fps = 120
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- window
config.window_decorations = "NONE"

-- tab bar

-- Color scheme (different themes I like so far; TODO: Explore more or make my own)
-- config.color_scheme = 'AlienBlood'
-- config.color_scheme = 'Atelier Savanna (base16)'
config.color_scheme = "Breath Darker (Gogh)"

-- config.colors = {
--   -- selection_fg = 'none',
--   selection_bg = 'rgba(10%, 10%, 10%)'
-- }

config.keys = {
	{
		key = "\\",
		mods = "CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- {
	-- 	key = "1",
	-- 	mods = "SUPER",
	-- 	action = wezterm.action.ActivateTab(0),
	-- },
	-- {
	-- 	key = "2",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.ActivateTab(1),
	-- },
	-- {
	-- 	key = "3",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.ActivateTab(2),
	-- },
	-- {
	-- 	key = "4",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.ActivateTab(3),
	-- },
	-- {
	-- 	key = "5",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.ActivateTab(4),
	-- },
	-- {
	-- 	key = "6",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.ActivateTab(5),
	-- },
	-- {
	-- 	key = "7",
	-- 	mods = "ALT",
	-- 	action = wezterm.action.ActivateTab(6),
	-- },
}

-- turning off the glyph error (annoying!)
config.warn_about_missing_glyphs = false

return config
