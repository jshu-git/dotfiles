return {
	{
		"echasnovski/mini.ai",
		dependencies = {
			{ "echasnovski/mini.extra", opts = {} },
		},
		config = function()
			local extras = require("mini.extra")
			require("mini.ai").setup({
				n_lines = 500,
				custom_textobjects = {
					D = extras.gen_ai_spec.diagnostic(),
					N = extras.gen_ai_spec.number(),
				},
			})

			vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
			vim.keymap.set("n", "<C-CR>", "cib", { remap = true })
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
