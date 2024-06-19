local ok, notify = pcall(require, "notify")
if not ok then
	return
end

------------------------
--- global functions ---
------------------------
_G.P = function(...)
	local msg = vim.inspect(...)
	notify(msg, "info", {
		on_open = function(win)
			vim.wo[win].conceallevel = 3
			vim.wo[win].concealcursor = ""
			vim.wo[win].spell = false
			local buf = vim.api.nvim_win_get_buf(win)
			vim.treesitter.start(buf, "lua")
		end,
	})
end

_G.R = function(pkg_name)
	require("plenary.reload").reload_module(pkg_name)
	return require(pkg_name)
end

local M = {}

M.icons = {
	error = "󰅚", -- x000f015a
	warn = "󰀪", -- x000f002a
	info = "󰋽", -- x000f02fd
	hint = "󰌶", -- x000f0336
}

-- M.is_in_list = function(value, list)
-- 	for _, v in pairs(list) do
-- 		if v == value then
-- 			return true
-- 		end
-- 	end
-- 	return false
-- end

M.count_matches = function()
	local cur_word = vim.fn.expandcmd("<cword>")
	local count = vim.api.nvim_exec2("%s/" .. cur_word .. "//ng", { output = true }).output
	notify(" " .. count, "info", { title = "search: " .. cur_word, render = "simple" })
end

M.toggle_qf = function()
	for _, info in ipairs(vim.fn.getwininfo()) do
		if info.quickfix == 1 then
			vim.cmd("cclose")
			return
		end
	end

	if next(vim.fn.getqflist()) == nil then
		print("qf list empty")
		return
	end
	vim.cmd("copen")
end

M.replace_file = function()
	vim.cmd("silent execute 'norm gg" .. '"' .. "_dGP'")
end

return M
