local keymap = vim.keymap

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Move to window using the <ctrl> hjkl keys
-- keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
-- keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
-- keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
-- keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to other buffer" })
keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to other buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete buffer and window" })
-- Clear search with <esc>
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Keywordprg
keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Commenting
keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment below" })
keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment above" })

-- Lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy plugin manager" })

-- New file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })

-- Location and Quickfix Lists
keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location list" })
keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix list" })

-- Quickfix Navigation
keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- Formatting
keymap.set({ "n", "v" }, "<leader>cf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format" })

-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next diagnostic" })
keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev diagnostic" })
keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next error" })
keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev error" })
keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next warning" })
keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev warning" })

-- Terminal Mappings
keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter normal mode" })
keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide terminal" })
keymap.set("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Windows
keymap.set("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })

-- Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search select telescope" })
keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by grep" })
keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search resume" })
keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search recent files ('.' for repeat)" })
keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "Fuzzy search current buffer" })
keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live grep open files",
	})
end, { desc = "Search in open files" })
keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search neovim files" })

-- Oil
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Copilot Chat
keymap.set({ "n", "v" }, "<leader>aa", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot chat" })
keymap.set({ "n" }, "<leader>am", "<CMD>CopilotChatModels<CR>", { desc = "Select chat model" })
keymap.set({ "n" }, "<leader>as", "<CMD>CopilotChatStop<CR>", { desc = "Stop Copilot chat" })
keymap.set({ "n" }, "<leader>aR", "<CMD>CopilotChatReset<CR>", { desc = "Reset Copilot chat" })
keymap.set({ "n", "v" }, "<leader>ae", "<CMD>CopilotChatExplain<CR>", { desc = "Explain selected code" })
keymap.set({ "n", "v" }, "<leader>ar", "<CMD>CopilotChatReview<CR>", { desc = "Review selected code" })
keymap.set({ "n", "v" }, "<leader>af", "<CMD>CopilotChatFix<CR>", { desc = "Fix selected code" })
keymap.set({ "n", "v" }, "<leader>ao", "<CMD>CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
keymap.set({ "n", "v" }, "<leader>ad", "<CMD>CopilotChatDocs<CR>", { desc = "Create documentation" })
keymap.set({ "n", "v" }, "<leader>at", "<CMD>CopilotChatTests<CR>", { desc = "Create tests for selected code" })
keymap.set("n", "<leader>ac", "<CMD>CopilotChatCommit<CR>", { desc = "Create commit message" })

-- Colorizer
keymap.set("n", "<leader>tc", "<CMD>ColorizerToggle<CR>", { desc = "Toggle colorizer" })
