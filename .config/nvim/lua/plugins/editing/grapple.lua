local grapple = require('grapple')
grapple.setup({
  win_opts = {
    width = 0.5,
    height = 0.4,
  },
})

-- default scope (git)
vim.keymap.set('n', '<Tab>', grapple.toggle_tags)
vim.keymap.set('n', '<leader>a', function()
  if grapple.exists() then
    vim.notify('Ungrappled')
  else
    vim.notify('Grappled: ' .. vim.fn.expand('%:t'))
  end
  grapple.toggle()
end, { desc = 'Grapple' })

-- global scope
vim.keymap.set('n', '<leader><Tab>', function()
  grapple.toggle_tags({ scope = 'global' })
end)
vim.keymap.set('n', '<leader>A', function()
  if grapple.exists({ scope = 'global' }) then
    vim.notify('Ungrappled (Global)')
    grapple.untag({ scope = 'global' })
  else
    vim.notify('Grappled (Global): ' .. vim.fn.expand('%:t'))
    grapple.tag({ scope = 'global' })
  end
end, { desc = 'Grapple (Global)' })

-- highlights
-- has to go here since lazy loaded
require('utils').apply_highlights({
  GrappleFooter = { link = 'FloatBorder' },
  GrappleCurrent = { link = 'Normal' },
  -- GrappleName = { link = 'CursorLine' },
})