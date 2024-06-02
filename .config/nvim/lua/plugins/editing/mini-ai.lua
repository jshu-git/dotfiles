return {
	"echasnovski/mini.ai",
	version = "*",
	dependencies = {
		"echasnovski/mini.extra",
	},
	config = function()
		local extra = require("mini.extra")
		require("mini.ai").setup({
			n_lines = 500,
			custom_textobjects = {
				g = extra.gen_ai_spec.buffer(),
				-- D = extra.gen_ai_spec.diagnostic(),
				-- I = extra.gen_ai_spec.indent(),
				L = extra.gen_ai_spec.line(),
				-- N = extra.gen_ai_spec.number(),
			},
		})
	end,
}
