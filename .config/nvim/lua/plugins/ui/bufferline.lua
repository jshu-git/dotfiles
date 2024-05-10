return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				themable = false,
				indicator = {
					style = "none",
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
				separator_style = { "", "" },
				always_show_bufferline = true,
			},
		})
		-- vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
		-- vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
		-- command! Bnext if bufnr() != bufnr('$') | bnext | endif
		-- command! Bprev if bufnr() != 1 | bprev | endif
	end,
}
