local neocodeium = require('neocodeium')
neocodeium.setup({
  manual = true,
  silent = true,
  filetypes = {
    ['*'] = true,
    ['grug-far'] = false,
  },
  debounce = true,
})

vim.keymap.set('i', '<Tab>', function()
  if neocodeium.visible() then
    neocodeium.accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
  end
end)
vim.keymap.set('i', '<C-\\>', neocodeium.clear)
vim.keymap.set('i', '<A-l>', neocodeium.accept_word)
vim.keymap.set('i', '<A-n>', function()
  neocodeium.cycle_or_complete(1)
end)
vim.keymap.set('i', '<A-p>', function()
  neocodeium.cycle_or_complete(-1)
end)
