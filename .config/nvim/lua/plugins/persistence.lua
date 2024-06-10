return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	-- opts = {},
	config = function()
		require("persistence").setup()
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>R",
		-- 	[[<cmd>lua require("persistence").load()<cr>]],
		-- 	{ desc = "Restore Session (Current Directory)" }
		-- )

		-- restore session for the current directory
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sr",
		-- 	[[<cmd>lua require("persistence").load()<cr>]],
		-- 	{ desc = "Restore Session (Current Directory)" }
		-- )

		-- restore last session
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sR",
		-- 	[[<cmd>lua require("persistence").load({ last = true })<cr>]],
		-- 	{ desc = "Restore Session (Last)" }
		-- )

		-- session won't be saved on exit
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sq",
		-- 	[[<cmd>lua require("persistence").stop()<cr>]],
		-- 	{ desc = "Stop Saving Session" }
		-- )
	end,
}
