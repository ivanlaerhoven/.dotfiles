return {
	{
		"ThePrimeagen/refactoring.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				"<leader>rs",
				pick,
				mode = "v",
				desc = "Refactor",
			},
			{
				"<leader>ri",
				function()
					require("refactoring").refactor("Inline Variable")
				end,
				mode = { "n", "v" },
				desc = "Inline variable",
			},
			{
				"<leader>rb",
				function()
					require("refactoring").refactor("Extract Block")
				end,
				desc = "Extract block",
			},
			{
				"<leader>rf",
				function()
					require("refactoring").refactor("Extract Block To File")
				end,
				desc = "Extract block to file",
			},
			{
				"<leader>rP",
				function()
					require("refactoring").debug.printf({ below = false })
				end,
				desc = "Debug print",
			},
			{
				"<leader>rp",
				function()
					require("refactoring").debug.print_var({ normal = true })
				end,
				desc = "Debug print variable",
			},
			{
				"<leader>rc",
				function()
					require("refactoring").debug.cleanup({})
				end,
				desc = "Debug cleanup",
			},
			{
				"<leader>rf",
				function()
					require("refactoring").refactor("Extract Function")
				end,
				mode = "v",
				desc = "Extract function",
			},
			{
				"<leader>rF",
				function()
					require("refactoring").refactor("Extract Function To File")
				end,
				mode = "v",
				desc = "Extract function to file",
			},
			{
				"<leader>rx",
				function()
					require("refactoring").refactor("Extract Variable")
				end,
				mode = "v",
				desc = "Extract variable",
			},
			{
				"<leader>rp",
				function()
					require("refactoring").debug.print_var()
				end,
				mode = "v",
				desc = "Debug print variable",
			},
		},
		opts = {
			prompt_func_return_type = {
				go = false,
				java = false,
				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			prompt_func_param_type = {
				go = false,
				java = false,
				cpp = false,
				c = false,
				h = false,
				hpp = false,
				cxx = false,
			},
			printf_statements = {},
			print_var_statements = {},
			show_success_message = true, -- shows a message with information about the refactor on success
			-- i.e. [Refactor] Inlined 3 variable occurrences
		},
	},
}
