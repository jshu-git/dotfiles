local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

now(function()
  local icons = require('mini.icons')
  icons.setup({
    filetype = {
      minifiles = { glyph = '󰉋', hl = 'Directory' },
      minipick = { glyph = '󰍉' },
    },
  })
  icons.mock_nvim_web_devicons()
end)
