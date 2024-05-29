return {
	"echasnovski/mini.comment",
	version = "*",
	config = function()
		require("mini.comment").setup({
			options = {
				ignore_blank_line = true,
				custom_commentstring = function()
					if vim.bo.filetype == "kdl" then
						return "// %s"
					end
					return vim.bo.commentstring
				end,
			},
			mappings = {
				comment_line = "<C-c>",
				comment_visual = "<C-c>",
			},
		})
	end,
}
