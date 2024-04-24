require("user.init")

-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>")

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.buffers" },
	{ import = "plugins.editing" },
	{ import = "plugins.ui" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
