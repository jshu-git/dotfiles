return {
	"echasnovski/mini.cursorword",
	config = function()
		require("mini.cursorword").setup({
			delay = 0,
		})
		vim.g.minicursorword_disable = true

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"buffer_manager",
				"lazy",
			},
			callback = function()
				vim.b.minicursorword_disable = true
			end,
		})

		vim.keymap.set("n", "<leader>c", function()
			vim.g.minicursorword_disable = not vim.g.minicursorword_disable
			-- hack
			vim.api.nvim_command("normal! l")
			vim.defer_fn(function()
				vim.api.nvim_command("normal! h")
			end, 1)
		end, { desc = "Toggle mini.cursorword" })
	end,
}
