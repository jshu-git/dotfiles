local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('MeanderingProgrammer/render-markdown.nvim')

  vim.keymap.set(
    'n',
    '<leader>tv',
    '<cmd>RenderMarkdown toggle<cr>',
    { desc = 'Toggle Markdown' }
  )
end)
