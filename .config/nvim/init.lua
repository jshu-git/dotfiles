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
	ui = {
		border = "single",
	},
	change_detection = {
		notify = false,
	},
})
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- close lazy with q/esc https://github.com/folke/lazy.nvim/discussions/1196
local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	desc = "Quit lazy with <esc>",
	callback = function()
		vim.keymap.set("n", "<esc>", function()
			vim.api.nvim_win_close(0, false)
		end, { buffer = true, nowait = true })
	end,
	group = user_grp,
})

vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("lackluster")
-- vim.cmd.colorscheme("no-clown-fiesta")
