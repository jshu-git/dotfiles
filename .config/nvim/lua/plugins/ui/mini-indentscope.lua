return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				animation = function(s, n)
					return 5
				end,
			},
			mappings = {
				goto_top = "",
				goto_bottom = "",
			},
			options = {
				try_as_border = true,
			},
			symbol = "│",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"alpha",
				"lazy",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
