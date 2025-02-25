local kulala = require('kulala')
local ui = require('kulala.ui')
kulala.setup({
  kulala_keymaps = {
    ['Show verbose'] = false,
    ['Next response'] = {
      '<C-n>',
      function()
        ui.show_next()
      end,
    },
    ['Previous response'] = {
      '<C-p>',
      function()
        ui.show_previous()
      end,
    },
  },
  additional_curl_options = { '--insecure', '--noproxy', '*' },
  ui = {
    winbar = false,
    default_view = 'headers_body',
    default_winbar_panes = { 'headers_body', 'verbose' },
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>kr', kulala.run, { desc = 'Kulala: Run' })
vim.keymap.set('n', '<leader>kk', kulala.replay, { desc = 'Kulala: Replay' })
-- vim.keymap.set('n', '<leader>ks', function()
--   vim.cmd('vsplit')
--   kulala.scratchpad()
-- end, { desc = 'Kulala: Scratchpad' })
vim.keymap.set('n', '<leader>ko', kulala.open, { desc = 'Kulala: Open' })
vim.keymap.set('n', '<leader>ky', kulala.copy, { desc = 'Kulala: Yank cURL' })
vim.keymap.set('n', '<leader>kp', kulala.from_curl, { desc = 'Kulala: Paste cURL' })
vim.keymap.set('n', '<leader>ki', kulala.inspect, { desc = 'Kulala: Inspect' })

-- POST https://httpbin.org/post HTTP/1.1
-- accept: application/json
-- content-type: application/json
-- {
--   "foo": "bar"
-- }
