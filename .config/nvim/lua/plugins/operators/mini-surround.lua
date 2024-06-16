return {
	"echasnovski/mini.surround",
	config = function()
		require("mini.surround").setup({
			mappings = {
				add = "sS",
				delete = "sd",
				replace = "sr",
				update_n_lines = "sn",

				highlight = "",
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
