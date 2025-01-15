local visits = require('mini.visits')
visits.setup({
  silent = true,
})
-- local pick = require('mini.pick')
-- local extra = require('mini.extra')

local custom_mappings = function(label)
  return {
    remove_label = {
      char = '<C-x>',
      func = function()
        local current = pick.get_picker_matches().current
        if current ~= nil then
          visits.remove_label(label, current)
          vim.notify('[mini.visits] Removed ' .. current .. ' from ' .. label)
        end
      end,
    },
  }
end

-- core
vim.keymap.set('n', '<Tab>', function()
  -- extra.pickers.visit_paths({ filter = 'core' }, { mappings = custom_mappings('core') })
  visits.select_path('', { filter = 'core' })
end, { desc = 'Visits (core)' })
vim.keymap.set('n', '<leader>a', function()
  visits.add_label('core')
  vim.notify('[mini.visits] Visited core label: ' .. vim.fn.expand('%:t'))
end, { desc = 'Add Visit (core)' })
vim.keymap.set('n', '<leader>A', function()
  visits.remove_label('core')
  vim.notify('[mini.visits] Removed core label: ' .. vim.fn.expand('%:t'))
end, { desc = 'Remove Visit (core)' })

-- global
vim.keymap.set('n', '<leader><Tab>', function()
  -- extra.pickers.visit_paths({ cwd = '', filter = 'global' }, { mappings = custom_mappings('global') })
  visits.select_path('', { filter = 'global' })
end, { desc = 'Visits (global)' })
vim.keymap.set('n', '<leader>v', function()
  visits.add_label('global')
  vim.notify('[mini.visits] Visited global label: ' .. vim.fn.expand('%:t'))
end, { desc = 'Add Visit (global)' })
vim.keymap.set('n', '<leader>V', function()
  visits.remove_label('global')
  vim.notify('[mini.visits] Visited global label: ' .. vim.fn.expand('%:t'))
end, { desc = 'Remove Visit (global)' })
