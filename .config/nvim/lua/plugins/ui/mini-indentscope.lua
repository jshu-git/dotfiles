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
			-- symbol = "│",
			symbol = "▏",
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

		-- highlights
		-- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { link = "NonText" })
	end,
}
