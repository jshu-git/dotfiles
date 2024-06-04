return {
	{
		"echasnovski/mini.bufremove",
		config = function()
			local mini = require("mini.bufremove")
			mini.setup()

			vim.keymap.set("n", "<A-c>", function()
				mini.delete(0, false)
			end)
			vim.keymap.set("n", "<leader>x", function()
				mini.delete(0, false)
				vim.cmd("q")
			end, { desc = "Delete Buffer and Window" })
		end,
	},

	-- {
	-- 	"vim-scripts/BufOnly.vim",
	-- 	config = function()
	-- 		vim.keymap.set("n", "<leader>X", ":BufOnly<CR>", { desc = "Delete All Buffers (Except Current)" })
	-- 	end,
	-- },
}
