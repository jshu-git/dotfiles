return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		{ "<leader>gG", "<cmd>LazyGitConfig<cr>", desc = "LazyGit Config" },
	},
	config = function()
		vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
	end,
}
