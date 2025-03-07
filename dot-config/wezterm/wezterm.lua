local wezterm = require 'wezterm'

local homePath = wezterm.home_dir;

local size = 0.5*472;
local config = {
    -- Set color
    color_scheme = "Catppuccin Mocha",
    colors = { selection_bg = 'rgba(245 194 231 42%)' },
    window_background_gradient = {
        colors = {
            'rgba(30 30 46 100%)',
            'rgba(30 30 46 095%)',
            'rgba(30 30 46 073%)',
            'rgba(30 30 46 073%)',
            'rgba(30 30 46 095%)',
            'rgba(30 30 46 100%)',
        },
        orientation = { Linear = { angle = -100.0 } },
    },
    -- -- -- -- --

    font = wezterm.font("FiraCodeNerdFontMono"),
    front_end = 'OpenGL',
    default_prog = { 'fish' },
    scrollback_lines = 50000,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    window_decorations = "RESIZE",
    hide_tab_bar_if_only_one_tab = true,
    pane_focus_follows_mouse = true,
    window_close_confirmation = 'NeverPrompt',

    window_padding = {
        left   = 4,
        right  = 4,
        top    = 4,
        bottom = 4,
    },

    skip_close_confirmation_for_processes_named = {
        'bash',
        'fish',
        'nu',
        'pwsh',
        'sh',
        'tmux',
        'zsh',
    },
    keys = {
        {
            key = 'w',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.CloseCurrentPane { confirm = false },
        },
        {
            key = "]",
            mods = "CTRL|ALT",
            action = wezterm.action.ActivateTabRelative(1),
        },
        {
            key = "[",
            mods = "CTRL|ALT",
            action = wezterm.action.ActivateTabRelative(-1),
        },
    }
}

for i = 1, 8 do
  -- CTRL+ALT + number to move to that position
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|ALT',
    action = wezterm.action.MoveTab(i - 1),
  })
end

return config;
