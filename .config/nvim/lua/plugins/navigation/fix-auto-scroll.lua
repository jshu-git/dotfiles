local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later

add('BranimirE/fix-auto-scroll.nvim')
require('fix-auto-scroll').setup()
