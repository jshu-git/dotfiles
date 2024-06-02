return {
	"echasnovski/mini.align",
	config = function()
		require("mini.align").setup({
			mappings = {
				start = "&",
				start_with_preview = "gA",
			},
		})
	end,
}
