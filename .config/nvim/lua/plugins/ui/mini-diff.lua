return {
	"echasnovski/mini.diff",
	config = function()
		local diff = require("mini.diff")
		diff.setup({
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
		vim.keymap.set("n", "<leader>gt", diff.toggle_overlay, { desc = "Toggle Overlay" })
	end,
}
