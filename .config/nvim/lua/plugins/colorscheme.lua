return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = { italic = true, bold = true },
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent",
					floats = "transparent",
				},
				lualine_bold = true,
				on_colors = function(colors)
					colors.border = "#3b4261" -- border color of split windows
					colors.bg_statusline = colors.none
				end,
				on_highlights = function(highlights, colors)
					highlights.MsgArea = { bg = colors.none }
					-- highlights.CursorLineNr = { bg = highlights.CursorLine.bg }
					highlights.CursorLineNr = { fg = "#ffff00", bg = colors.bg_highlight }
				end,
			})
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
