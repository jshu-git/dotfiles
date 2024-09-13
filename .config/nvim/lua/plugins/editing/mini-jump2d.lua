local jump2d = require('mini.jump2d')
jump2d.setup({
  mappings = {
    start_jumping = '',
  },
})
-- jump to any word
-- vim.keymap.set({ 'n', 'x', 'o' }, 'gw', function()
--   local opts = vim.tbl_deep_extend('force', jump2d.builtin_opts.word_start, {
--     view = { n_steps_ahead = 1 },
--     allowed_lines = { blank = false },
--   })
--   jump2d.start(opts)
-- end, { desc = 'Jump (Word)' })

-- jump to punctuation
-- vim.keymap.set({ 'n', 'x', 'o' }, 'g.', function()
--   jump2d.start({
--     spotter = jump2d.gen_pattern_spotter('%p+'),
--     allowed_lines = { blank = false },
--   })
-- end, { desc = 'Jump (Punctuation)' })

vim.keymap.set({ 'n', 'x', 'o' }, 't', function()
  local opts = vim.tbl_deep_extend('force', jump2d.builtin_opts.word_start, {
    view = { n_steps_ahead = 1 },
    allowed_lines = { blank = false },
  })
  jump2d.start(opts)
end)

vim.keymap.set({ 'n', 'x', 'o' }, 'T', function()
  jump2d.start({
    spotter = jump2d.gen_pattern_spotter('%p+'),
    allowed_lines = { blank = false },
  })
end)
