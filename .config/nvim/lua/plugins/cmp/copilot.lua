if vim.env.SSH_CLIENT == nil then
  return
end

require('copilot').setup({
  panel = {
    auto_refresh = true,
    keymap = {
      open = '<A-CR>',
    },
    layout = {
      ratio = 0.33,
    },
  },
  suggestion = {
    auto_trigger = true,
    hide_during_completion = false,
    debounce = 15,
    keymap = {
      accept = false,
      accept_word = '<A-l>',
      accept_line = false,
      next = '<A-n>',
      prev = '<A-p>',
    },
  },
  filetypes = {
    ['*'] = true,
  },
})

local suggestion = require('copilot.suggestion')
-- https://github.com/zbirenbaum/copilot.lua/issues/91
vim.keymap.set('i', '<Tab>', function()
  if suggestion.is_visible() then
    -- suggestion.accept_word()
    suggestion.accept_line()
  else
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes('<Tab>', true, false, true),
      'n',
      false
    )
  end
end)
vim.keymap.set('i', '<S-Tab>', suggestion.dismiss)
vim.keymap.set('i', '<A-l>', suggestion.accept_word)
vim.keymap.set('i', '<A-n>', suggestion.next)
vim.keymap.set('i', '<A-p>', suggestion.prev)
