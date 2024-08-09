return {
  'NStefan002/visual-surround.nvim',
  event = 'ModeChanged',
  config = function()
    require('visual-surround').setup({
      surround_chars = { '{', '[', '(', "'", '"', '`', '<' },
    })
  end,
}
