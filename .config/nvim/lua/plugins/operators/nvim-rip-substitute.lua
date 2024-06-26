return {
	"chrisgrieser/nvim-rip-substitute",
	config = function()
		local rip = require("rip-substitute")
		rip.setup({
			keymaps = {
				confirm = "<leader>w",
				abort = "<esc>",
			},
			incrementalPreview = {
				matchHlGroup = "Search",
				rangeBackdrop = {
					enabled = false,
				},
			},
			regexOptions = {
				casing = "smart-case",
			},
		})

		vim.keymap.set("n", "sf", function()
			rip.sub()
		end, { desc = "Substitute cword (File)" })
		vim.keymap.set("x", "sf", function()
			rip.sub()
		end, { desc = "Substitute (Range)" })
	end,
}
