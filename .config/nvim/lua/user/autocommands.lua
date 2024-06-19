-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 150 })
	end,
})

-- disable auto comments
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- commenting in .kdl files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "kdl",
	callback = function()
		vim.opt.commentstring = "// %s"
	end,
})

-- close some filetypes with <esc>
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lazy",
		"alpha",
		"minifiles-help",
	},
	callback = function(event)
		vim.keymap.set("n", "<esc>", "<cmd>quit<CR>", { buffer = event.buf })
	end,
})

-- hide certain filetypes from buffer list (:ls)
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- LazyVim
-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*.txt", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		---@diagnostic disable-next-line: undefined-field
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
