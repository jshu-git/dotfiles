return {
	"echasnovski/mini.cursorword",
	version = "*",
	config = function()
		require("mini.cursorword").setup({
			delay = 300,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				-- "help",
				"alpha",
				"lazy",
			},
			callback = function()
				vim.b.minicursorword_disable = true
			end,
		})
	end,
}
