local wezterm = require 'wezterm'

local config = {
    -- Set color
    color_scheme = "Catppuccin Mocha",
    colors = { selection_bg = 'rgba(189 147 249 73%)' },
    window_background_gradient = {
        colors = { 'rgba(68 71 90 50%)', 'rgba(40 42 54 80%)', 'rgba(40 42 54 98%)', 'rgba(40 42 54 100%)' },
        orientation = { Linear = { angle = -100.0 } },
    },
    -- -- -- -- --

    font = wezterm.font("FiraCode Nerd Font Mono"),
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
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

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- config.default_domain = "WSL:nix";
    config.default_prog = { 'pwsh' };
else
    config.window_decorations = "NONE";
end

return config;
