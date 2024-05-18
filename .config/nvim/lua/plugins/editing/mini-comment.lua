return {
	"echasnovski/mini.comment",
	version = "*",
	config = function()
		require("mini.comment").setup({
			options = {
				ignore_blank_line = true,
			},
			mappings = {
				comment_line = "<C-c>",
				comment_visual = "<C-c>",
			},
		})
	end,
}
