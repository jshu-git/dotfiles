local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>")

require("lazy").setup({
	require("plugins.editing.init"),
	require("plugins.movement.init"),
	require("plugins.ui.init"),

	-- big plugins
	require("plugins.oil"),
	require("plugins.telescope"),
	require("plugins.nvim-treesitter"),

	-- TODO: lsp/completion
	require("plugins.nvim-cmp"),
	require("plugins.lspconfig"),
})
