return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function()
		require("lsp_signature").setup({
			max_width = math.floor(0.5 * vim.o.columns),
			max_height = math.floor(0.25 * vim.o.lines),
			hint_enable = false,
			handler_opts = {
				border = "single",
			},
			toggle_key = "<C-s>",
		})
	end,
}
