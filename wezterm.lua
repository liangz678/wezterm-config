local wezterm = require("wezterm")

-- local launch_menu = {}
-- local default_shell = "/bin/zsh"
local padding = {
	left = "1cell",
	right = "1cell",
	top = "1.5cell",
	bottom = "0.5cell",
}

-- Reload the configuration every ten minutes
wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = { name, "mini-file-icons", "Hack Nerd Font", "SauceCodePro Nerd Font" }
	return wezterm.font_with_fallback(names, params)
end

local function get_theme()
	local _time = os.date("*t")
	if _time.hour >= 1 and _time.hour < 9 then
		return "Rosé Pine (base16)"
	elseif _time.hour >= 9 and _time.hour < 17 then
		return "tokyonight_night"
	elseif _time.hour >= 17 and _time.hour < 21 then
		return "Catppuccin Mocha"
	elseif _time.hour >= 21 and _time.hour < 24 or _time.hour >= 0 and _time.hour < 1 then
		return "kanagawabones"
	end
end

return {
	bidi_enabled = true,
	bidi_direction = "AutoLeftToRight",
	color_scheme = get_theme(),
	font = font_with_fallback({
		family = "FiraCode Nerd Font",
		harfbuzz_features = {
			"zero",
		},
	}),
	font_rules = {
		{
			intensity = "Bold",
			font = font_with_fallback({
				family = "FiraCode Nerd Font",
				harfbuzz_features = {
					"zero",
				},
				weight = "Medium",
			}),
		},
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback({
				family = "Iosevka Nerd Font",
				-- family = "Dank Mono",
				weight = "Medium",
				italic = true,
			}),
		},
		{
			italic = true,
			font = font_with_fallback({
				-- family = "Dank Mono",
				family = "Iosevka Nerd Font",
				weight = "Regular",
				italic = true,
			}),
		},
	},
	leader = { key = "a", mods = "ALT" },
	keys = {
		-- 	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
		-- 	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "d", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "d", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
		-- 	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		-- 	{ key = "t", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		-- 	{ key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
		-- 	{ key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
		-- 	{ key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
		-- 	{ key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
		{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
		-- 	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
		-- 	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
		-- 	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
		-- 	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
		-- { key = "w", mods = "SUPER", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "w", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
		{ key = "t", mods = "ALT", action = wezterm.action.SpawnTab("DefaultDomain") },
		{ key = "m", mods = "LEADER", action = "ToggleFullScreen" },

		{ key = "b", mods = "CTRL", action = wezterm.action({ SendString = "\x02" }) },
		{ key = "p", mods = "CTRL", action = wezterm.action({ SendString = "\x1B[A" }) },
		{ key = "n", mods = "CTRL", action = wezterm.action({ SendString = "\x1B[B" }) },
		{ key = "a", mods = "CTRL", action = wezterm.action({ SendString = "\x01" }) },
		{ key = "e", mods = "CTRL", action = wezterm.action({ SendString = "\x05" }) },
	},
	initial_cols = 138,
	initial_rows = 48,
	use_dead_keys = false,
	window_padding = padding,
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	selection_word_boundary = " \t\n{}[]()\"'`,;:@",
	-- disable_default_key_bindings = true,
	line_height = 1.25,
	font_size = 13,
	window_background_opacity = 0.95,
	bold_brightens_ansi_colors = false,
	-- swap_backspace_and_delete = false,
	-- term = "wezterm",
	-- freetype_load_target = "Light",
}
