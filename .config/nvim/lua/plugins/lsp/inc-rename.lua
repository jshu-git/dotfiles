local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  add('smjonas/inc-rename.nvim')
  require('inc_rename').setup({
    preview_empty_name = true,
    save_in_cmdline_history = false,
  })
end)
