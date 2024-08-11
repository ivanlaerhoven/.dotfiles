return {
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					-- Use `vim.keymap.set` correctly by including descriptions in the options table
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, "Next Hunk")
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, "Prev Hunk")
				map("n", "]H", function()
					gs.nav_hunk("last")
				end, "Last hunk")
				map("n", "[H", function()
					gs.nav_hunk("first")
				end, "First hunk")
				map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
				map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
				map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage hunk")
				map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
				map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk inline")
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
				map("n", "<leader>gB", function()
					gs.blame()
				end, "Blame buffer")
				map("n", "<leader>gd", gs.diffthis, "Diff this")
				map("n", "<leader>gD", function()
					gs.diffthis("~")
				end, "Diff this ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns select hunk")
			end,
		},
	},
}
