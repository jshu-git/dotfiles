-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
	end,
})

-- toggle relative/absolute line numbers
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	callback = function()
-- 		vim.opt.relativenumber = false
-- 	end,
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	callback = function()
-- 		vim.opt.relativenumber = true
-- 	end,
-- })

-- disable auto comments
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- open help window in a vertical split to the right
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "*.txt" },
	callback = function()
		if vim.o.filetype == "help" then
			vim.cmd.wincmd("L")
		end
	end,
})

-- enable spell checking for certain filetypes
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.txt", "*.md", "*.tex" },
	callback = function()
		vim.opt.spell = true
	end,
})
