return {
	"j-morano/buffer_manager.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("buffer_manager").setup({
			{
				select_menu_item_commands = {
					v = {
						key = "<C-s>",
						command = "vsplit",
					},
					h = {
						key = "<C-v>",
						command = "split",
					},
					true,
				},
				short_file_names = true,
				loop_nav = false, -- not working for some reason
			},
		})
		local ui = require("buffer_manager.ui")
		vim.keymap.set("n", "<leader><Tab>", ui.toggle_quick_menu, { desc = "Buffers" })
		vim.keymap.set("n", "<Tab>", ui.nav_next, { desc = "Next Buffer" })
		vim.keymap.set("n", "<S-Tab>", ui.nav_prev, { desc = "Previous Buffer" })

		local keys = "12345"
		for i = 1, #keys do
			local key = keys:sub(i, i)
			vim.keymap.set("n", string.format("<leader>%s", key), function()
				ui.nav_file(i)
			end, { desc = "Buffer " .. i })
		end
	end,
}