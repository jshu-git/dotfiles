return {
  'echasnovski/mini.misc',
  config = function()
    local misc = require('mini.misc')
    misc.setup_restore_cursor()
    -- vim.keymap.set("n", "<leader>tm", function()
    --   misc.zoom()
    -- end, { desc = "Toggle Maximize" })
  end,
}
