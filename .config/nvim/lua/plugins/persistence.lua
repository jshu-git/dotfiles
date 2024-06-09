return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	-- init = function()
	-- restore session for the current directory
	-- vim.api.nvim_set_keymap(
	-- 	"n",
	-- 	"<leader>sr",
	-- 	[[<cmd>lua require("persistence").load()<cr>]],
	-- 	{ desc = "Restore Session (Current Directory)" }
	-- )
	--
	-- -- restore last session
	-- vim.api.nvim_set_keymap(
	-- 	"n",
	-- 	"<leader>sR",
	-- 	[[<cmd>lua require("persistence").load({ last = true })<cr>]],
	-- 	{ desc = "Restore Session (Last)" }
	-- )
	--
	-- -- session won't be saved on exit
	-- vim.api.nvim_set_keymap(
	-- 	"n",
	-- 	"<leader>sq",
	-- 	[[<cmd>lua require("persistence").stop()<cr>]],
	-- 	{ desc = "Stop Saving Session" }
	-- )
	-- end,
}
