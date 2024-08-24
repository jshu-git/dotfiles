local formats = require('blame.formats.default_formats')
require('blame').setup({
  merge_consecutive = true,
  format_fn = formats.date_author_message,
})

vim.keymap.set('n', '<leader>gb', '<cmd>BlameToggle<cr>', { desc = 'Blame' })
