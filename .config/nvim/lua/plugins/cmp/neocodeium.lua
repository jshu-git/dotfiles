return {
  'monkoose/neocodeium',
  cond = vim.env.SSH_CLIENT == nil,
  event = 'InsertEnter',
  config = function()
    local neocodeium = require('neocodeium')
    neocodeium.setup({
      -- manual = true,
      filetypes = {
        ['*'] = true,
        ['rip-substitute'] = false,
      },
      debounce = true,
    })

    vim.keymap.set('i', '<Tab>', function()
      if neocodeium.visible() then
        -- neocodeium.accept()
        neocodeium.accept_word()
      else
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes('<Tab>', true, false, true),
          'n',
          false
        )
      end
    end)
    vim.keymap.set('i', '<C-\\>', neocodeium.clear)
    -- vim.keymap.set('i', '<A-l>', function()
    --   if neocodeium.visible() then
    --     neocodeium.accept_word()
    --   else
    --     neocodeium.cycle_or_complete(1)
    --   end
    -- end)
    vim.keymap.set('i', '<A-n>', function()
      neocodeium.cycle_or_complete(1)
    end)
    vim.keymap.set('i', '<A-p>', function()
      neocodeium.cycle_or_complete(-1)
    end)
  end,
}
