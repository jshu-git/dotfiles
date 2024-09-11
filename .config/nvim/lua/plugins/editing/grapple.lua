local grapple = require('grapple')
local popup = require('utils').popup
grapple.setup({
  win_opts = {
    height = popup.height,
    width = popup.width,
    row = math.floor(0.5 * (vim.o.lines - popup.height)),
    col = math.floor(0.5 * (vim.o.columns - popup.width)),
  },
})

-- default scope (git)
vim.keymap.set('n', '<Tab>', grapple.toggle_tags)
vim.keymap.set('n', '<leader>a', function()
  if grapple.exists() then
    vim.notify('[grapple.nvim] Ungrappled')
  else
    vim.notify('[grapple.nvim] Grappled: ' .. vim.fn.expand('%:t'))
  end
  grapple.toggle()
end, { desc = 'Grapple' })

-- global scope
vim.keymap.set('n', '<leader><Tab>', function()
  grapple.toggle_tags({ scope = 'global' })
end, { desc = 'Grapple Tags (Global)' })
vim.keymap.set('n', '<leader>A', function()
  if grapple.exists({ scope = 'global' }) then
    vim.notify('[grapple.nvim] Ungrappled (Global)')
    grapple.untag({ scope = 'global' })
  else
    vim.notify('[grapple.nvim] Grappled (Global): ' .. vim.fn.expand('%:t'))
    grapple.tag({ scope = 'global' })
  end
end, { desc = 'Grapple (Global)' })
