local grapple = require('grapple')
grapple.setup({
  win_opts = {
    width = 0.5,
    height = 0.4,
  },
})

-- https://undelete.pullpush.io/r/neovim/comments/vguomm/how_can_i_map_tab_but_keep_the_default_action_for/
vim.keymap.set('n', '<C-i>', '<C-i>')

-- default scope (git)
vim.keymap.set('n', '<Tab>', grapple.toggle_tags)
vim.keymap.set('n', '<leader>a', function()
  if grapple.exists() then
    vim.notify('[grapple.nvim] Ungrappled')
  else
    vim.notify('[grapple.nvim] : ' .. vim.fn.expand('%:t'))
  end
  grapple.toggle()
end, { desc = 'Grapple' })

-- global scope
vim.keymap.set('n', '<leader><Tab>', function()
  grapple.toggle_tags({ scope = 'global' })
end)
vim.keymap.set('n', '<leader>A', function()
  if grapple.exists({ scope = 'global' }) then
    vim.notify('[grapple.nvim] Ungrappled (Global)')
    grapple.untag({ scope = 'global' })
  else
    vim.notify('[grapple.nvim] Grappled (Global): ' .. vim.fn.expand('%:t'))
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
