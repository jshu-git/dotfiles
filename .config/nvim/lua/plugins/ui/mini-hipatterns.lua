return {
	"echasnovski/mini.hipatterns",
	config = function()
		local hipatterns = require("mini.hipatterns")
		hipatterns.setup({
			highlighters = {
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		vim.keymap.set("n", "<leader>th", function()
			hipatterns.toggle()
		end, { desc = "Toggle Highlights" })
	end,
}
