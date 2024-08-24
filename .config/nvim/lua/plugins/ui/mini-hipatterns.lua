local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

later(function()
  local hipatterns = require('mini.hipatterns')

  hipatterns.setup({
    highlighters = {
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)
