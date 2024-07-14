return {
  "declancm/cinnamon.nvim",
  config = function()
    require("cinnamon").setup({
      keymaps = {
        basic = true,
      },
      options = {
        delay = 4,
        -- mode = "window",
      },
    })
  end,
}
