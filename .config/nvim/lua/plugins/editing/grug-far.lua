local grug = require('grug-far')
grug.setup({
  windowCreationCommand = '60vsplit',
  helpLine = {
    -- whether to show the help line at the top of the buffer
    enabled = false,
  },
  -- wrap = false,
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
    openNextLocation = { n = '<C-n>' },
    openPrevLocation = { n = '<C-p>' },
    -- gotoLocation = { n = '<enter>' },
    -- pickHistoryEntry = { n = '<enter>' },
    abort = { n = '<C-c>' },
    -- help = { n = 'g?' },
    toggleShowCommand = { n = 'gs' },
    swapEngine = { n = 'ge' },
    previewLocation = { n = '<Tab>' },
    swapReplacementInterpreter = '',
  },
  -- icons = { enabled = false },
  history = {
    autoSave = { onBufDelete = false },
  },
  resultLocation = {
    showNumberLabel = false,
  },
})

-- search
-- vim.keymap.set('n', '<leader>r', grug.open, { desc = 'Replace' })

-- replace cword
vim.keymap.set({ 'n', 'x' }, '<leader>r', function()
  grug.open({
    startCursorRow = 3,
    prefills = {
      search = vim.fn.expand('<cword>'),
    },
  })
end, { desc = 'Replace cword' })
vim.keymap.set({ 'n', 'x' }, '<leader>R', function()
  grug.open({
    startCursorRow = 3,
    prefills = {
      search = vim.fn.expand('<cword>'),
      paths = vim.fn.expand('%:p:h'),
    },
  })
end, { desc = 'Replace cword (Relative)' })

-- replace cword (buffer)
vim.keymap.set({ 'n', 'x' }, '<leader>*', function()
  grug.open({
    startCursorRow = 3,
    prefills = {
      search = vim.fn.expand('<cword>'),
      paths = vim.fn.expand('%:p'),
    },
  })
end, { desc = 'Replace cword (Buffer)' })
