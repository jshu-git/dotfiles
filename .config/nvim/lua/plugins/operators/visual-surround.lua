return {
  'NStefan002/visual-surround.nvim',
  keys = {
    { '{', mode = { 'x' } },
    { '[', mode = { 'x' } },
    { '(', mode = { 'x' } },
    { "'", mode = { 'x' } },
    { '"', mode = { 'x' } },
    { '`', mode = { 'x' } },
    { '<', mode = { 'x' } },
  },
  config = function()
    require('visual-surround').setup({
      surround_chars = { '{', '[', '(', "'", '"', '`', '<' },
    })
  end,
}
