vim.g.undotree_WindowLayout = 3
vim.g.undotree_DiffAutoOpen = 0
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_TreeNodeShape = '󰧞'
vim.g.undotree_TreeVertShape = '│'
vim.g.undotree_TreeReturnShape = '╲'
vim.g.undotree_TreeSplitShape = '╱'
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_HelpLine = 0
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Undo Tree' })

vim.g.Undotree_CustomMap = function()
  vim.keymap.set('n', '<esc>', '<Plug>UndotreeClose', { buffer = true, silent = true })
  vim.keymap.set('n', 'U', '<Plug>UndotreeRedo', { buffer = true, silent = true })
end
