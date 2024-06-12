return {
	"echasnovski/mini.cursorword",
	config = function()
		require("mini.cursorword").setup({
			delay = 500,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"buffer_manager",
				"alpha",
				"lazy",
			},
			callback = function()
				vim.b.minicursorword_disable = true
			end,
		})
	end,
}
