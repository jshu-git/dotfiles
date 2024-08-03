return {
  'yorickpeterse/nvim-pqf',
  config = function()
    require('pqf').setup({
      filename_truncate_prefix = '[…]',
    })
  end,
}
