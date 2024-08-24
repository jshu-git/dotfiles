local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('jshu-git/blame.nvim')

  local formats = require('blame.formats.default_formats')
  require('blame').setup({
    merge_consecutive = true,
    format_fn = formats.date_author_message,
  })

  vim.keymap.set('n', '<leader>gb', '<cmd>BlameToggle<cr>', { desc = 'Blame' })
end)
