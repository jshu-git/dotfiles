-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- toggle relative/absolute line numbers
vim.api.nvim_create_autocmd("InsertEnter", {
	desc = "Switch to absolute line numbers in insert mode",
	group = vim.api.nvim_create_augroup("absolute-line-numbers", { clear = true }),
	callback = function()
		vim.opt.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	desc = "Switch to relative line numbers in normal mode",
	group = vim.api.nvim_create_augroup("relative-line-numbers", { clear = true }),
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- disable auto comments
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Open help window in a vertical split to the right and don't wrap
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("right-help", {}),
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
			vim.opt.wrap = false
		end
	end,
})
