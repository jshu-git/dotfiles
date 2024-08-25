local grapple = require('grapple')
grapple.setup({
  -- style = 'basename',
  win_opts = {
    width = 0.5,
    height = 0.25,
  },
})
vim.keymap.set('n', '<leader>a', function()
  if grapple.exists() then
    vim.notify('Ungrappled')
  else
    vim.notify('Grappled: ' .. vim.fn.expand('%:t'))
  end
  grapple.toggle()
end, { desc = 'Grapple' })
vim.keymap.set('n', '<Tab>', grapple.toggle_tags)

-- highlights
-- has to go here since lazy loaded
require('utils').apply_highlights({
  GrappleFooter = { link = 'FloatBorder' },
  GrappleCurrent = { link = 'Normal' },
  -- GrappleName = { link = 'CursorLine' },
})
