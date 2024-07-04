return {
  "mei28/luminate.nvim",
  event = "VeryLazy",
  config = function()
    require("luminate").setup({
      duration = 200,
      paste = {
        enabled = false,
      },
    })
  end,
}
