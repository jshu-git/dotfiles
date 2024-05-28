return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup({
			draw = {
				delay = 1,
			},
			symbol = "▏",
		})
	end,
}
