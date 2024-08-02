return {
  'echasnovski/mini.misc',
  config = function()
    local misc = require('mini.misc')
    misc.setup_restore_cursor()
    misc.setup_termbg_sync()
    vim.keymap.set('n', '<C-w>m', misc.zoom, { desc = 'Toggle Maximize' })
  end,
}
