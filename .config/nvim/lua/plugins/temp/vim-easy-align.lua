return {
	"junegunn/vim-easy-align",
	config = function()
		vim.keymap.set("x", "&", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
		vim.keymap.set("n", "&", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
	end,
}
