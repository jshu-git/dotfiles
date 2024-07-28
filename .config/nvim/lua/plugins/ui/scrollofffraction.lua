return {
  'nkakouros-original/scrollofffraction.nvim',
  config = function()
    require('scrollofffraction').setup({
      scrolloff_fraction = 0.3,
    })
  end,
}
