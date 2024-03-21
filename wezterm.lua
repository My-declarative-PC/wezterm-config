local wezterm = require 'wezterm'

local config = {
    -- Set color
    color_scheme = "Catppuccin Mocha",
    colors = { selection_bg = 'rgba(189 147 249 73%)' },
    window_background_gradient = {
        colors = {
            'rgba(40 42 54 100%)',
            'rgba(40 42 54 088%)',
            'rgba(40 42 54 042%)',
            'rgba(40 42 54 042%)',
            'rgba(40 42 54 088%)',
            'rgba(40 42 54 100%)',
        },
        orientation = { Linear = { angle = -100.0 } },
    },
    -- -- -- -- --

    font = wezterm.font("FiraCode"),
    front_end = 'OpenGL',
    default_prog = { 'fish' },
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    window_decorations = "NONE",
    hide_tab_bar_if_only_one_tab = true,
    pane_focus_follows_mouse = true,
    window_close_confirmation = 'NeverPrompt',

    window_padding = {
        left = 4,
        right = 4,
        top = 4,
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

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.font = wezterm.font("FiraCode Nerd Font Mono")
    config.default_prog = { 'pwsh' };
    config.window_decorations = "TITLE";
end

return config;
