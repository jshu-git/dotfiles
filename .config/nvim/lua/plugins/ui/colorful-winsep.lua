return {
  "nvim-zh/colorful-winsep.nvim",
  event = "WinNew",
  config = function()
    require("colorful-winsep").setup({
      hi = { fg = "white" },
      smooth = false,
      exponential_smoothing = false,
    })
  end,
}
