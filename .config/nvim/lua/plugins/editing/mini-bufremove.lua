return {
	"echasnovski/mini.bufremove",
	version = "*",
	config = function()
		local mini = require("mini.bufremove")
		mini.setup()
		vim.keymap.set("n", "<leader>x", function()
			mini.delete(0, false)
		end, { desc = "Delete Buffer" })
		vim.keymap.set("n", "<leader>X", function()
			mini.delete(0, true)
		end, { desc = "Delete Buffer (Force)" })
	end,
}
