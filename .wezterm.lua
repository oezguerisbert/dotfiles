local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- config.default_domain = 'WSL:Ubuntu-22.04-v2'

config.keys = {
  {
    key = 't',
    mods = 'ALT',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'w',
    mods = 'ALT',
    action = act.CloseCurrentTab { confirm = false },
  },
}

return config
