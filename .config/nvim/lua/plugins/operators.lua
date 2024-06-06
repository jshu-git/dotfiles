return {
	{
		"echasnovski/mini.ai",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
			})
		end,
	},

	{
		"echasnovski/mini.operators",
		config = function()
			local operators = require("mini.operators")
			operators.setup({
				evaluate = {
					prefix = "se",
				},
				exchange = {
					prefix = "sx",
				},
				multiply = {
					prefix = "sm",
				},
				replace = {
					prefix = "",
				},
				sort = {
					prefix = "so",
				},
			})
			operators.make_mappings("replace", {
				textobject = "s",
				line = "ss",
				selection = "ss",
			})
		end,
	},

	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "S",
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
	},

	{
		"echasnovski/mini.splitjoin",
		config = function()
			require("mini.splitjoin").setup({
				mappings = {
					toggle = "sj",
					split = "",
					join = "",
				},
			})
		end,
	},
}
