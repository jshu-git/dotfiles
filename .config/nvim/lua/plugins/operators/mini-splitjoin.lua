return {
  "echasnovski/mini.splitjoin",
  keys = {
    { "sj", mode = { "n", "x" } },
  },
  config = function()
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "sj",
      },
    })
  end,
}
