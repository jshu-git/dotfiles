return {
	"echasnovski/mini.diff",
	config = function()
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "-" },
			},
			mappings = {
				apply = "<leader>gh",
				reset = "<leader>gH",
				textobject = "ih",
				goto_first = "[H",
				goto_prev = "[h",
				goto_next = "]h",
				goto_last = "]H",
			},
		})
	end,
}
