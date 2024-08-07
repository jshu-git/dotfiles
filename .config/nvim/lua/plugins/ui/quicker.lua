return {
  -- 'yorickpeterse/nvim-pqf',
  -- filetype = 'qf',
  -- config = function()
  --   require('pqf').setup({
  --     filename_truncate_prefix = '[…]',
  --   })
  --
  --   vim.api.nvim_create_autocmd('FileType', {
  --     pattern = 'qf',
  --     callback = function()
  --       vim.opt_local.relativenumber = false
  --     end,
  --   })
  -- end,
  'stevearc/quicker.nvim',
  filetype = 'qf',
  config = function()
    local quicker = require('quicker')
    quicker.setup({
      opts = { number = true },
      keys = {
        {
          '>',
          function()
            quicker.expand({
              before = 1,
              after = 1,
              add_to_existing = true,
            })
          end,
        },
        { '<', quicker.collapse },
      },
      type_icons = {
        E = require('config.utils').signs.Error,
        W = require('config.utils').signs.Warn,
        I = require('config.utils').signs.Info,
        N = require('config.utils').signs.Hint,
        H = require('config.utils').signs.Hint,
      },
    })

    vim.keymap.set('n', '<leader>c', function()
      if vim.tbl_isempty(vim.fn.getqflist()) then
        vim.notify('No Quickfix', vim.log.levels.WARN)
      else
        quicker.toggle({ focus = true })
      end
    end, {
      desc = 'Quickfix List',
    })
    vim.keymap.set(
      'n',
      '<leader>C',
      quicker.refresh,
      { desc = 'Quickfix (Refresh)' }
    )
  end,
}
