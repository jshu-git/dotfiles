return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("ufo").setup({
			open_fold_hl_timeout = 250,
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
			preview = {
				win_config = {
					border = "single",
					winblend = 0,
					maxheight = 15,
				},
				mappings = {
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

			vim.keymap.set("n", "zp", function()
				require("ufo").peekFoldedLinesUnderCursor()
			end, { desc = "Peek Fold" }),
		})
	end,
}
