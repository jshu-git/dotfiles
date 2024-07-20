return {
  enabled = false,
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      -- configuration goes here, for example:
      relculright = true,
      segments = {
        -- line numbers
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
        },
        -- signcolumn
        {
          text = { "%s" },
        },
      },
    })
  end,
}
