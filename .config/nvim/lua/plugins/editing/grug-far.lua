local grug = require('grug-far')
grug.setup({
  debounceMs = 250,
  -- engines = {
  --   ripgrep = {
  --     placeholders = { enabled = false },
  --   },
  -- },
  helpLine = { enabled = false },
  startInInsertMode = false,
  -- wrap = false,
  transient = true,
  keymaps = {
    replace = false,
    qflist = false,
    syncLocations = { n = 'S' },
    syncLine = { n = 's' },
    close = false,
    historyOpen = { n = 'gh' },
    historyAdd = false,
    refresh = { n = 'gr' },
    openLocation = false,
    openNextLocation = { n = '<C-n>' },
    openPrevLocation = { n = '<C-p>' },
    -- gotoLocation = { n = '<enter>' },
    -- pickHistoryEntry = { n = '<enter>' },
    abort = { n = '<C-c>' },
    -- help = { n = 'g?' },
    toggleShowCommand = { n = 'gs' },
    swapEngine = { n = 'ge' },
    previewLocation = { n = '<Tab>' },
    swapReplacementInterpreter = false,
  },
  resultsHighlight = false,
  icons = { enabled = false },
  resultLocation = {
    showNumberLabel = false,
  },
})

-- replace cword (buffer)
vim.keymap.set({ 'n', 'x' }, '<leader>r', function()
  grug.open({
    startCursorRow = 3,
    prefills = {
      search = vim.fn.expand('<cword>'),
      paths = vim.fn.expand('%:p'),
    },
  })
end, { desc = 'Replace cword (Buffer)' })

-- replace cword
vim.keymap.set({ 'n', 'x' }, '<leader>R', function()
  grug.open({
    startCursorRow = 3,
    prefills = {
      search = vim.fn.expand('<cword>'),
    },
  })
end, { desc = 'Replace cword' })

-- vim.keymap.set({ 'n', 'x' }, '<leader>R', function()
--   grug.open({
--     startCursorRow = 3,
--     prefills = {
--       search = vim.fn.expand('<cword>'),
--       paths = vim.fn.expand('%:p:h'),
--     },
--   })
-- end, { desc = 'Replace cword (Relative)' })
