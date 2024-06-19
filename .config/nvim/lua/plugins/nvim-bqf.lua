return {
	"kevinhwang91/nvim-bqf",
	ft = "qf",
	config = function()
		local bqf = require("bqf")
		bqf.setup({
			auto_resize_height = true,
			preview = {
				auto_preview = false,
				border = "single",
				show_scroll_bar = false,
				winblend = 10,
			},
			func_map = {
				split = "<C-s>",
			},
		})

		vim.keymap.set("n", "<leader>c", "<cmd>copen<CR>", { desc = "Quickfix List" })
	end,
}
