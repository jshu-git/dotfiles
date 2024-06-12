return {
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
}
