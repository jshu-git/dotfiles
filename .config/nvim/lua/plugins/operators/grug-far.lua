return {
  'MagicDuck/grug-far.nvim',
  keys = {
    '<leader>s',
    { '<leader>r', mode = { 'n', 'x' } },
    { '<leader>R', mode = { 'n', 'x' } },
    { 'sW', mode = { 'n', 'x' } },
  },
  config = function()
    local grug = require('grug-far')
    grug.setup({
      transient = true,
      keymaps = {
        replace = '',
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
        -- help = { n = 'g?' },
        toggleShowCommand = { n = 'gs' },
        swapEngine = { n = 'ge' },
      },
      resultsSeparatorLineChar = '▔',
      -- currently broken
      -- icons = { enabled = false },
      history = {
        autoSave = { onBufDelete = false },
      },
      folding = {
        foldcolumn = '0',
      },
    })

    -- search
    vim.keymap.set('n', '<leader>s', grug.grug_far, { desc = 'Grug Far' })

    -- search/replace cword
    vim.keymap.set({ 'n', 'x' }, '<leader>r', function()
      grug.grug_far({
        startCursorRow = 4,
        prefills = {
          search = vim.fn.expand('<cword>'),
        },
      })
    end, { desc = 'Replace' })
    vim.keymap.set({ 'n', 'x' }, '<leader>R', function()
      grug.grug_far({
        startCursorRow = 4,
        prefills = {
          search = vim.fn.expand('<cword>'),
          paths = vim.fn.expand('%:p:h'),
        },
      })
    end, { desc = 'Replace (Relative)' })

    -- current file
    vim.keymap.set({ 'n', 'x' }, 'sW', function()
      grug.grug_far({
        startCursorRow = 4,
        prefills = {
          search = vim.fn.expand('<cword>'),
          paths = vim.fn.expand('%'),
        },
      })
    end, { desc = 'Subsitute cword (File)' })
  end,
}
