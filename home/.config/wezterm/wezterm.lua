--- init config --------------------------------------- {{{
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
------------------------------------------------------- }}}

config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.adjust_window_size_when_changing_font_size = false

config.initial_cols = 80
config.initial_rows = 40

config.color_scheme = 'GruvboxDark'  -- TODO: sync this with weechat
config.scrollback_lines = 99999
config.enable_scroll_bar = false
config.enable_tab_bar = false

    -- mouse (F that)
config.mouse_wheel_scrolls_tabs = false

config.default_cursor_style = 'SteadyBlock'

config.term = 'wezterm'

    -- fonts
config.font = wezterm.font_with_fallback {
    'Iosevka Custom 15',
    'Iosevka Nerd Font Mono',
    'NotoSansMono Nerd Font Mono',
    'Noto Sans Mono Nerd Font Complete',
    'Noto Sans Mono',
    'PowerlineSymbols',
    'Powerline Symbols',
    'PowerlineExtraSymbols',
    'Powerline Extra Symbols',
    'Noto Color Emoji',
    'Iosevka Custom 15',
}
config.font_size = 10
config.underline_thickness = "2pt"
config.bold_brightens_ansi_colors = true

    -- desktop
config.tiling_desktop_environments = {
  'X11 LG3D',
  'X11 bspwm',
  'X11 i3',
  'X11 dwm',
  'Wayland',
}

    -- hyperlink rules

-- Use the defaults as a base
config.hyperlink_rules = wezterm.default_hyperlink_rules()

table.insert(config.hyperlink_rules, {
  format = 'https://steamcommunity.com/sharedfiles/filedetails/?id=$1',
  highlight = 0,
  regex = [[workshop-([0-9]+)]],
})
table.insert(config.hyperlink_rules, {
  format = 'https://store.steampowered.com/app/$1',
  highlight = 0,
  regex = [[gameID\s([0-9]+)]],
})

config.max_fps = 240

------------------------------------------------------- {{{ return
-- and finally, return the configuration to wezterm
return config

-- vim: foldmethod=marker
-- }}}
