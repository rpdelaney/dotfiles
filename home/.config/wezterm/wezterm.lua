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

config.initial_cols = 80
config.initial_rows = 120

config.color_scheme = 'GruvboxDark'  -- sync this with weechat
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
}
config.font_size = 16
config.underline_thickness = "2pt"
config.bold_brightens_ansi_colors = true

    -- desktop
config.tiling_desktop_environments = {
  'X11 LG3D',
  'X11 bspwm',
  'X11 i3',
  'X11 dwm',
} -- TODO: how to add wayland?

------------------------------------------------------- {{{ return
-- and finally, return the configuration to wezterm
return config

-- vim: foldmethod=marker
-- }}}
