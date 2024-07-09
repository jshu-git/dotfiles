return {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup({
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
