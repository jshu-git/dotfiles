return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	event = "BufReadPost",
	config = function()
		local ufo = require("ufo")
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.keymap.set("n", "zR", ufo.openAllFolds)
		vim.keymap.set("n", "zM", ufo.closeAllFolds)
		ufo.setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
