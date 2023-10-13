-- Get the wezterm APIU
local wezterm = require 'wezterm'

-- config table
local config = {}

-- for newer version of wezterm for better error message
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- starting to apply actual settings

config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular', stretch = 'Condensed' })
config.font_rasterizer = 'FreeType'
config.font_size = 11

-- animation; FYI: for settings with GPU
config.animation_fps = 30
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- window
config.window_decorations = "NONE"

-- tab bar


-- Color scheme (different themes I like so far; TODO: Explore more or make my own)
-- config.color_scheme = 'AlienBlood'
-- config.color_scheme = 'Atelier Savanna (base16)'
config.color_scheme = 'Breath Darker (Gogh)'

config.keys = {
  {
    key = '\\', mods = 'CTRL', action = wezterm.action.SplitHorizontal{ domain = 'CurrentPaneDomain' }
  },
  {
    key = '-', mods = 'CTRL', action = wezterm.action.SplitVertical{ domain = 'CurrentPaneDomain' },
  }
}

return config
