if vim.env.SSH_CLIENT ~= nil then
	vim.g.editorconfig = false
end

require("config.options")
require("config.autocommands")
require("config.highlights")
require("config.keymaps")

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.cmp" },
	{ import = "plugins.editing" },
	{ import = "plugins.git" },
	{ import = "plugins.lsp" },
	{ import = "plugins.operators" },
	{ import = "plugins.ui" },
}, {
	ui = { border = "single", backdrop = 100 },
	change_detection = { notify = false },
})
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy" })
