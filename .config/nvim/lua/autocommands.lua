-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- toggle relative/absolute line numbers
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- disable auto comments
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- open help window in a vertical split to the right and don't wrap
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
			vim.opt.wrap = false
		end
	end,
})
