-- Function to close empty and unnamed buffers
local function close_empty_unnamed_buffers()
	-- Get a list of all buffers
	local buffers = vim.api.nvim_list_bufs()

	-- Iterate over each buffer
	for _, bufnr in ipairs(buffers) do
		-- Check if the buffer is empty and doesn't have a name
		if
			vim.api.nvim_buf_is_loaded(bufnr)
			and vim.api.nvim_buf_get_name(bufnr) == ""
			and vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == ""
		then
			-- Get all lines in the buffer
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

			-- Initialize a variable to store the total number of characters
			local total_characters = 0

			-- Iterate over each line and calculate the number of characters
			for _, line in ipairs(lines) do
				total_characters = total_characters + #line
			end

			-- Close the buffer if it's empty
			if total_characters == 0 then
				vim.api.nvim_buf_delete(bufnr, { force = true })
			end
		end
	end
end

return {
	{
		"akinsho/bufferline.nvim",
		event = "BufWinEnter",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1" },
			{ "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2" },
			{ "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3" },
			{ "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4" },
			{ "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5" },
			{ "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to buffer 6" },
			{ "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to buffer 7" },
			{ "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to buffer 8" },
			{ "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to buffer 9" },
		},
		config = function()
			require("bufferline").setup({
				options = {
					numbers = "ordinal",
					offsets = {
						{
							filetype = "neo-tree",
							text = "",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
					},
					diagnostics = "nvim_lsp",
					separator_style = { "", "" },
					buffer_close_icon = "",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					show_close_icon = false,
					show_buffer_close_icons = false,
					always_show_bufferline = false,
					indicator = {
						style = "none",
					},
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
				},
			})
			-- Call the function to close empty and unnamed buffers
			close_empty_unnamed_buffers()
		end,
	},
}
