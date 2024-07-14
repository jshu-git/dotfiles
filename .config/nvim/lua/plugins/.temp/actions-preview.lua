return {
  "aznhe21/actions-preview.nvim",
  config = function()
    require("actions-preview").setup({
      highlight_command = {
        require("actions-preview.highlight").delta(),
      },
      backend = { "nui" },
      nui = {
        preview = {
          border = {
            style = "single",
            padding = { 0, 0 },
          },
        },
        select = {
          border = {
            style = "single",
            padding = { 0, 0 },
          },
        },
      },
    })
  end,
}
