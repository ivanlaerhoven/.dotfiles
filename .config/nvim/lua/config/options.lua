vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.fillchars = { eob = " " }
vim.opt.termguicolors = true
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
