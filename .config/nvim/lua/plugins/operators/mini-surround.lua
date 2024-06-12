return {
	"echasnovski/mini.surround",
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "S",
				delete = "sd",
				highlight = "sh",
				replace = "sr",
				update_n_lines = "sn",

				find = "",
				find_left = "",
				suffix_last = "",
				suffix_next = "",
			},
			n_lines = 100,
			respect_selection_type = true,
		})
	end,
}
