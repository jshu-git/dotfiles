require("user.options")
require("user.keymaps")
require("user.autocommands")

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
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.editing" },
	{ import = "plugins.ui" },
}, {
	ui = { border = "single" },
	change_detection = { notify = false },
})
require("lazy.view.config").keys.close = "<esc>"
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy" })
