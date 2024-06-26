return {
	"j-morano/buffer_manager.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("buffer_manager").setup({
			select_menu_item_commands = {
				v = {
					key = "<C-v>",
					command = "vsplit",
				},
				h = {
					key = "<C-s>",
					command = "split",
				},
			},
			loop_nav = false,
			borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		})

		local ui = require("buffer_manager.ui")
		vim.keymap.set("n", "<Tab>", ui.nav_next)
		vim.keymap.set("n", "<S-Tab>", ui.nav_prev)
		vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu, { desc = "Buffer Manager" })

		local keys = "12345"
		for i = 1, #keys do
			local key = keys:sub(i, i)
			vim.keymap.set("n", string.format("<leader>%s", key), function()
				ui.nav_file(i)
			end, { desc = "Buffer " .. i })
		end
	end,
}
