return {
  'MagicDuck/grug-far.nvim',
  keys = {
    { 'sg', mode = { 'n', 'x' } },
  },
  config = function()
    local grug = require('grug-far')
    grug.setup({
      startCursorRow = 4,
      transient = true,
      keymaps = {
        replace = '<leader>w',
        qflist = { n = '<C-q>' },
        syncLocations = { n = 'S' },
        syncLine = { n = 's' },
        close = { n = '<esc>' },
        historyOpen = { n = 'gh' },
        historyAdd = '',
        refresh = { n = 'gr' },
        openLocation = { n = '<Tab>' },
        -- gotoLocation = { n = '<enter>' },
        -- pickHistoryEntry = { n = '<enter>' },
        abort = { n = '<C-c>' },
        help = { n = 'g?' },
        toggleShowRgCommand = { n = 'gs' },
      },
      resultsSeparatorLineChar = '▔',
      icons = { enabled = false },
      folding = { enabled = false },
    })

    vim.keymap.set({ 'n', 'x' }, 'sg', function()
      grug.grug_far({
        prefills = {
          search = vim.fn.expand('<cword>'),
        },
      })
    end, { desc = 'Grug Far' })
    vim.keymap.set({ 'n', 'x' }, 'sG', function()
      grug.grug_far({
        prefills = {
          search = vim.fn.expand('<cword>'),
          paths = vim.fn.expand('%:p:h'),
        },
      })
    end, { desc = 'Grug Far (Relative)' })
  end,
}
