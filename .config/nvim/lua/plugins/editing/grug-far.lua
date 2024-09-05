local grug = require('grug-far')
grug.setup({
  wrap = false,
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
    openLocation = '',
    -- openNextLocation = { n = '<down>' },
    -- openPrevLocation = { n = '<up>' },
    -- gotoLocation = { n = '<enter>' },
    -- pickHistoryEntry = { n = '<enter>' },
    abort = { n = '<C-c>' },
    -- help = { n = 'g?' },
    toggleShowCommand = { n = 'gs' },
    swapEngine = { n = 'ge' },
    previewLocation = { n = '<Tab>' },
  },
  icons = { enabled = false },
  history = {
    autoSave = { onBufDelete = false },
  },
  resultLocation = {
    showNumberLabel = false,
  },
})

-- search
vim.keymap.set('n', '<leader>s', grug.open, { desc = 'Grug Far' })

-- replace cword
vim.keymap.set({ 'n', 'x' }, '<leader>r', function()
  grug.open({
    startCursorRow = 4,
    prefills = {
      search = vim.fn.expand('<cword>'),
    },
  })
end, { desc = 'Replace' })
vim.keymap.set({ 'n', 'x' }, '<leader>R', function()
  grug.open({
    startCursorRow = 4,
    prefills = {
      search = vim.fn.expand('<cword>'),
      paths = vim.fn.expand('%:p:h'),
    },
  })
end, { desc = 'Replace (Relative)' })

-- replace (current file)
vim.keymap.set({ 'n', 'x' }, 'sW', function()
  grug.open({
    startCursorRow = 4,
    prefills = {
      search = vim.fn.expand('<cword>'),
      paths = vim.fn.expand('%'),
    },
  })
end, { desc = 'Subsitute cword (File)' })
