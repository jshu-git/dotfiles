local jump2d = require('mini.jump2d')
jump2d.setup({
  spotter = jump2d.builtin_opts.word_start.spotter,
  view = {
    n_steps_ahead = 1,
    dim = true,
  },
  allowed_lines = {
    blank = false,
    cursor_at = false,
    fold = false,
  },
  allowed_windows = {
    not_current = false,
  },
  mappings = {
    -- start_jumping = 'gw',
    start_jumping = '\\',
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
