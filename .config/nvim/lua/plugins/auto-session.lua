return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_save_enabled = true,
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "/" },
		})
		vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
		vim.keymap.set("n", "<leader>sw", "<cmd>SessionSave<CR>", { desc = "Save Session" })
		-- vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, { desc = "Sessions" })
	end,
}
