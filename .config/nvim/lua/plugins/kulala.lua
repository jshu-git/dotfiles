local kulala = require('kulala')
kulala.setup({
  ui = {
    default_view = 'headers_body',
    default_winbar_panes = { 'body', 'headers', 'headers_body', 'verbose' },
  },
  -- scratchpad_default_contents = {
  -- 'TODO',
  -- },
})

vim.keymap.set('n', '<leader>kr', kulala.run, { desc = 'Kulala: Run' })
vim.keymap.set('n', '<leader>kk', kulala.replay, { desc = 'Kulala: Replay' })
vim.keymap.set('n', '<leader>ks', function()
  vim.cmd('vsplit')
  kulala.scratchpad()
end, { desc = 'Kulala: Scratchpad' })
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
