return {
  {
    "echasnovski/mini.basics",
    config = function()
      require("mini.basics").setup({
        options = {
          basic = true,
          win_borders = "single",
          extra_ui = true,
        },
        mappings = {
          basic = false,
        },
        autocommands = {
          basic = false,
        },
      })
    end,
  },

  {
    "echasnovski/mini.misc",
    config = function()
      local misc = require("mini.misc")
      misc.setup_restore_cursor()
    end,
  },

  {
    "echasnovski/mini.extra",
    config = true,
  },
}
