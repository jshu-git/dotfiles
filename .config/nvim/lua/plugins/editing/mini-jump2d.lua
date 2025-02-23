local jump2d = require('mini.jump2d')
jump2d.setup({
  spotter = jump2d.builtin_opts.word_start.spotter,
  view = {
    n_steps_ahead = 1,
  },
  allowed_lines = {
    blank = false,
  },
  mappings = {
    start_jumping = ',',
  },
  silent = true,
})

-- vim.keymap.set('n', 't', jump2d.start, { desc = 'Jump (Word)' })

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
