vim.diagnostic.config({ virtual_text = false })
require('tiny-inline-diagnostic').setup({
  preset = 'simple',
  options = {
    show_source = true,
    throttle = 0,
    multilines = {
      enabled = true,
      always_show = true,
    },
  },
  signs = {
    diag = ' ',
  },
})
