return {
	-- "rmagatti/auto-session",
	-- config = function()
	-- 	require("auto-session").setup({
	-- 		auto_save_enabled = true,
	-- 		auto_restore_enabled = false,
	-- 		auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "/" },
	-- 	})
	-- 	vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	-- 	vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
	-- 	vim.keymap.set("n", "<leader>sw", "<cmd>SessionSave<CR>", { desc = "Save Session" })
	-- 	-- vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, { desc = "Sessions" })
	-- end,

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
