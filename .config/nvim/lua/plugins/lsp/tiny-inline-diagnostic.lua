vim.diagnostic.config({ virtual_text = false })
require('tiny-inline-diagnostic').setup({
  -- preset = 'minimal',
  options = {
    show_source = true,
    throttle = 0,
    multiple_diag_under_cursor = true,
    multilines = {
      enabled = true,
      always_show = true,
    },
    show_all_diags_on_cursorline = true,
    enable_on_insert = false,
  },
})
