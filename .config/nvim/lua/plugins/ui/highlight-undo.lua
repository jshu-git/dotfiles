return {
	"tzachar/highlight-undo.nvim",
	config = function()
		require("highlight-undo").setup({
			duration = 250,
			undo = {
				hlgroup = "HighlightUndo",
				mode = "n",
				lhs = "u",
				map = "undo",
				opts = {},
			},
			redo = {
				hlgroup = "HighlightRedo",
				mode = "n",
				lhs = "U",
				map = "redo",
				opts = {},
			},
			highlight_for_count = true,
		})
	end,
}