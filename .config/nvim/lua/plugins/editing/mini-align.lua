return {
	"echasnovski/mini.align",
	version = "*",
	config = function()
		require("mini.align").setup({
			mappings = {
				start = "&",
				start_with_preview = "gA",
			},
		})
	end,
}
