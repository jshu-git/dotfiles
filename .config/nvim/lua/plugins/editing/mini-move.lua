return {
	"echasnovski/mini.move",
	version = "*",
	config = function()
		require("mini.move").setup({
			mappings = {
				left = "<A-h>",
				right = "<A-l>",
				down = "<A-j>",
				up = "<A-k>",
				line_left = "<A-h>",
				line_right = "<A-l>",
				line_down = "<A-j>",
				line_up = "<A-k>",
			},
		})
	end,
}
