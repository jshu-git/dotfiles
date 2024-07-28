return {
  'smjonas/inc-rename.nvim',
  event = 'LspAttach',
  config = function()
    require('inc_rename').setup({
      preview_empty_name = true,
      save_in_cmdline_history = false,
    })
  end,
}
