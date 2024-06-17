return {
	"olimorris/persisted.nvim",
	lazy = false,
	config = function()
		-- barbar
		vim.opt.sessionoptions:append("globals")
		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "PersistedSavePre",
			group = vim.api.nvim_create_augroup("PersistedHooks", {}),
			callback = function()
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
			end,
		})

		require("persisted").setup({
			should_autosave = function()
				if vim.bo.filetype == "alpha" then
					return false
				end
				return true
			end,
			autoload = true,
			on_autoload_no_session = function()
				vim.notify("persisted.nvim: No existing session to autoload")
			end,
		})
	end,
}
