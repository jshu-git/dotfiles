return {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			max_width = math.floor(0.5 * vim.o.columns),
			max_height = math.floor(0.25 * vim.o.lines),
			floating_window = false,
			hint_enable = false,
			handler_opts = {
				border = "single",
			},
			toggle_key = "<C-s>",
			toggle_key_flip_floatwin_setting = true,
			select_signature_key = "<C-S-s>",
		})
	end,
}
