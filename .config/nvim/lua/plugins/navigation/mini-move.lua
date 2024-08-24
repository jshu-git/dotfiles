local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

-- needs to be now because overrides lsp builtin K keymap
now(function()
  require('mini.move').setup({
    -- can't use alt because of escape sending alt https://github.com/LunarVim/LunarVim/issues/1857
    mappings = {
      left = 'H',
      right = 'L',
      down = 'J',
      up = 'K',
      line_left = 'H',
      line_right = 'L',
      line_down = 'J',
      line_up = 'K',
    },
  })
end)
