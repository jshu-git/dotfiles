return {
  'yorickpeterse/nvim-pqf',
  filetype = 'qf',
  config = function()
    require('pqf').setup({
      filename_truncate_prefix = '[…]',
    })
  end,

  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = function()
      vim.opt_local.relativenumber = false
    end,
  }),
}
