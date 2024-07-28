return {
  'echasnovski/mini.diff',
  config = function()
    local diff = require('mini.diff')
    diff.setup({
      view = {
        style = 'sign',
        signs = {
          add = '▌',
          change = '▌',
          delete = '▌',
        },
        priority = 1,
      },
      mappings = {
        apply = '',
        reset = 'gH',
        textobject = 'gh',
      },
    })

    vim.keymap.set(
      'n',
      '<leader>td',
      diff.toggle_overlay,
      { desc = 'Git: Toggle Diff' }
    )

    -- reset hunks
    vim.keymap.set(
      'n',
      '<leader>gr',
      'gHgh',
      { desc = 'Reset (Hunk)', remap = true }
    )
    vim.keymap.set(
      'x',
      '<leader>gr',
      'gH',
      { desc = 'Reset Hunk (Visual)', remap = true }
    )
    vim.keymap.set('n', '<leader>gR', function()
      diff.do_hunks(0, 'reset')
    end, { desc = 'Reset (Buffer)' })

    -- hunks to quickfix
    vim.keymap.set('n', '<leader>gq', function()
      vim.fn.setqflist(diff.export('qf'))
      vim.cmd('copen')
    end, { desc = 'Hunks (Quickfix)' })
  end,
}
