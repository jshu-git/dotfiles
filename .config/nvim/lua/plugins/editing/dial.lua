return {
  'monaqa/dial.nvim',
  keys = { '-', '=' },
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        -- numbers
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,

        -- constants
        augend.constant.new({
          elements = { 'false', 'true' },
        }),
        augend.constant.new({
          elements = { 'no', 'yes' },
        }),
        augend.constant.new({
          elements = { 'and', 'or' },
        }),
        augend.constant.new({
          elements = { '&&', '||' },
          word = false,
        }),

        -- hexcolor
        augend.hexcolor.new({
          case = 'lower',
        }),
      },
      visual = {
        augend.integer.alias.decimal,
      },
    })

    local map = require('dial.map')
    -- vim.keymap.set("n", "=", function()
    -- 	map.manipulate("increment", "normal")
    -- end)
    -- vim.keymap.set("n", "-", function()
    -- 	map.manipulate("decrement", "normal")
    -- end)
    vim.keymap.set('n', '=', map.inc_normal())
    vim.keymap.set('n', '-', map.dec_normal())
    vim.keymap.set('v', '=', map.inc_visual())
    vim.keymap.set('v', '-', map.dec_visual())
    -- vim.keymap.set("v", "g=", map.inc_gvisual())
    -- vim.keymap.set("v", "g-", map.dec_gvisual())
  end,
}
