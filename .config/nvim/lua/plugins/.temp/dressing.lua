return {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup({
      select = {
        enabled = false,
      },
      input = {
        override = function(conf)
          conf.col = -1
          conf.row = 0
          return conf
        end,
      },
    })
  end,
}
