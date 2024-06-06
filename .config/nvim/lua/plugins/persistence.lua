return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	init = function()
		-- restore the session for the current directory
		vim.api.nvim_set_keymap("n", "<leader>sr", [[<cmd>lua require("persistence").load()<cr>]], {})

		-- stop Persistence => session won't be saved on exit
		vim.api.nvim_set_keymap("n", "<leader>sq", [[<cmd>lua require("persistence").stop()<cr>]], {})
	end,
}
