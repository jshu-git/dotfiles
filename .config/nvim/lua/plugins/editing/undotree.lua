return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_WindowLayout = 3
		vim.g.undotree_SplitWidth = 50
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_TreeNodeShape = "·"
		vim.g.undotree_TreeVertShape = "│"
		vim.g.undotree_ShortIndicators = 1
		vim.g.undotree_HelpLine = 0
		vim.g.undotree_CursorLine = 0
		vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree" })
	end,
}
