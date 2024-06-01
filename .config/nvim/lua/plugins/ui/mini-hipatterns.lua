return {
	"echasnovski/mini.hipatterns",
	version = "*",
	config = function()
		local mini = require("mini.hipatterns")
		mini.setup({
			highlighters = {
				hex_color = mini.gen_highlighter.hex_color(),
			},
		})

		vim.keymap.set("n", "<leader>th", function()
			mini.toggle()
		end, { desc = "Toggle Highlights" })
	end,
}
