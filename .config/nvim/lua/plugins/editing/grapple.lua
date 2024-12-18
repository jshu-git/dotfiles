local grapple = require('grapple')
grapple.setup({
  win_opts = {
    height = 0.5,
    width = 0.75,
    footer = '',
  },
})

-- default scope (git)
vim.keymap.set('n', '<Tab>', grapple.toggle_tags)
vim.keymap.set('n', '<leader>a', function()
  local name = vim.fn.expand('%:t')
  if grapple.exists() then
    local confirm = vim.fn.confirm('Ungrapple ' .. name .. '?', '&Yes\n&No\n', 1, 'Question')
    if confirm == 1 then
      vim.notify('[grapple.nvim] Ungrappled')
    else
      vim.defer_fn(function()
        vim.cmd('echon')
      end, 10)
      return
    end
    vim.cmd('echon')
  else
    vim.notify('[grapple.nvim] Grappled: ' .. name)
  end
  grapple.toggle()
  vim.cmd('redrawstatus')
end, { desc = 'Grapple' })

-- global scope
vim.keymap.set('n', '<leader><Tab>', function()
  grapple.toggle_tags({ scope = 'global' })
  vim.cmd('redrawstatus')
end, { desc = 'Grapple Tags (Global)' })
vim.keymap.set('n', '<leader>A', function()
  if grapple.exists({ scope = 'global' }) then
    vim.notify('[grapple.nvim] Ungrappled (Global)')
    grapple.untag({ scope = 'global' })
  else
    vim.notify('[grapple.nvim] Grappled (Global): ' .. vim.fn.expand('%:t'))
    grapple.tag({ scope = 'global' })
  end
  vim.cmd('redrawstatus')
end, { desc = 'Grapple (Global)' })

-- telescope
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope grapple tags<cr>', { desc = 'Files (Grapple)' })
vim.keymap.set('n', '<leader>fG', function()
  local results = {}
  ---@diagnostic disable-next-line: param-type-mismatch
  for _, tag in ipairs(grapple.tags()) do
    table.insert(results, tag.path)
  end
  require('telescope.builtin').live_grep({ search_dirs = results })
end, { desc = 'Live Grep (Grapple)' })
