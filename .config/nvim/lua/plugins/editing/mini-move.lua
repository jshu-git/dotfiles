return {
	"echasnovski/mini.move",
	config = function()
		require("mini.move").setup({
			mappings = {
				left = "",
				right = "",
				down = "<A-j>",
				up = "<A-k>",
				line_left = "",
				line_right = "",
				line_down = "<A-j>",
				line_up = "<A-k>",
			},
		})
	end,
}
