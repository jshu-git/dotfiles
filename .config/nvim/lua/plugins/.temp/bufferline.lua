return {
	"akinsho/bufferline.nvim",
	-- enabled = false,
	event = "BufReadPre",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				-- indicator = {
				-- style = "none",
				-- },
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = { "", "" },
				always_show_bufferline = true,
			},
		})
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>")
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
		vim.keymap.set("n", "<leader><Tab>", "<cmd>BufferLineMoveNext<CR>")
		vim.keymap.set("n", "<leader><S-Tab>", "<cmd>BufferLineMovePrev<CR>")
	end,
}
