local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('numToStr/Comment.nvim')
  require('Comment').setup({
    mappings = {
      basic = false,
      extra = false,
    },
  })

  vim.keymap.set('n', '<C-c>', '<Plug>(comment_toggle_linewise_current)')
  vim.keymap.set('x', '<C-c>', '<Plug>(comment_toggle_linewise_visual)')

  -- block
  vim.keymap.set('n', '<C-S-c>', '<Plug>(comment_toggle_blockwise_current)')
  vim.keymap.set('x', '<C-S-c>', '<Plug>(comment_toggle_blockwise_visual)')

  vim.keymap.set(
    'n',
    '<leader><C-c>',
    'gcgc',
    { remap = true, desc = 'Uncomment' }
  )
end)
