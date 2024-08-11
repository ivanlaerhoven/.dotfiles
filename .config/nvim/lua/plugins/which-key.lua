return {
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("which-key").setup()

			require("which-key").add({
				{ "<leader>a", group = "AI", mode = { "n", "v" } },
				{ "<leader>b", group = "Buffer" },
				{ "<leader>c", group = "Code", mode = { "n", "v" } },
				{ "<leader>d", group = "Document" },
				{ "<Leader>f", group = "Formatting", mode = { "n", "v" } },
				{ "<leader>h", group = "Harpoon" },
				{ "<leader>r", group = "Refactoring", mode = { "n", "v" } },
				{ "<leader>s", group = "Search" },
				{ "<leader>w", group = "Window" },
				{ "<leader>t", group = "Toggle" },
				{ "<leader>g", group = "Git", mode = { "n", "v" } },
				{ "<leader>x", group = "Diagnostics" },
			})
		end,
	},
}
