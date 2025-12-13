return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {
			style = "moon", -- 'storm' is default, 'moon' is slightly darker, 'night' is darkest.
			-- 'moon' usually looks best with transparency.
			transparent = true, -- <--- The Master Switch
			styles = {
				sidebars = "transparent", -- This removes the bg from Neo-tree / Nvim-tree
				floats = "transparent", -- This removes the bg from floating windows (Telescope, etc.)
			},
			-- Fix for borders to ensure they look crisp on transparent backgrounds
			on_highlights = function(hl, c)
				hl.Border = { fg = c.blue0, bg = "none" } -- Adjust border color if needed
				hl.FloatBorder = { fg = c.blue0, bg = "none" }
			end,
		},
	},

	-- Ensure LazyVim knows to load this colorscheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
}
