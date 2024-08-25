local substitute = require('substitute')
substitute.setup({
  preserve_cursor_position = true,
  highlight_substituted_text = {
    timer = require('utils').highlight_timeout,
  },
})
vim.keymap.set('n', 's', substitute.operator)
vim.keymap.set('n', 'ss', substitute.line, { desc = 'Substitute (Line)' })
vim.keymap.set('n', 'S', substitute.eol)
vim.keymap.set('x', 'ss', substitute.visual, { desc = 'Substitute (Visual)' })
