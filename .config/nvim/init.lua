-- Load options
require("config.options")

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Import all plugins
require("lazy").setup({
	{ import = "plugins" },
})

-- Setup keymaps and autocommands
require("config.keymaps")
require("config.autocmds")

-- Setup notifications
---@diagnostic disable-next-line: missing-fields
require("notify").setup({
	background_colour = "#000000",
})
vim.notify = require("notify")
