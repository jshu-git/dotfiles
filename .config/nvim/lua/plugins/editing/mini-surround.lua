return {
	"echasnovski/mini.surround",
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "sa",
				delete = "sd",
				highlight = "sh",
				replace = "sr",

				find = "",
				find_left = "",
				update_n_lines = "",
				suffix_last = "",
				suffix_next = "",
			},
		})
	end,
}
