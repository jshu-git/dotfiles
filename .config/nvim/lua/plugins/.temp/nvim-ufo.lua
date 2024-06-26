return {
	"kevinhwang91/nvim-ufo",
	priority = 1000,
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		-- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
		vim.o.foldlevel = 10
		vim.o.foldlevelstart = 10
		vim.o.foldenable = true
		vim.keymap.set("n", "z0", "<cmd>set foldlevel=10<CR>", { desc = "Reset Fold Level" })
		vim.keymap.set("n", "z=", "zr", { desc = "Fold Less" })
		vim.keymap.set("n", "z-", "zm", { desc = "Fold More" })

		require("ufo").setup({
			open_fold_hl_timeout = 200,
			preview = {
				win_config = {
					border = "single",
					winblend = 0,
				},
				mappings = {
					switch = "gs",
					close = "<esc>",
				},
			},

			-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#customize-fold-text
			fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂%d"):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end,
		})
	end,
}
