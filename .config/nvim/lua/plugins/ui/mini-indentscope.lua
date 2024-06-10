return {
	"echasnovski/mini.indentscope",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				animation = function()
					return 4
				end,
			},
			options = {
				try_as_border = true,
			},
			symbol = "▏",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"alpha",
				"help",
				"lazy",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
