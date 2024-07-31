return {
  'dmtrKovalenko/caps-word.nvim',
  keys = {
    { '<C-s>', mode = { 'i' } },
  },
  config = function()
    local caps = require('caps-word')
    caps.setup()

    vim.keymap.set('i', '<C-s>', caps.toggle)
  end,
}
