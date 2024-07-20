return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      delay = 250,
      win = {
        width = { max = 0.3 },
        height = { max = -2 },
        border = "single",
        title_pos = "center",
      },
      sort = { "group", "desc" },
      icons = {
        breadcrumb = "󰐕",
        separator = "│",
        group = "",
        mappings = false,
      },
      show_help = false,
    })

    -- groups
    wk.add({
      {
        mode = { "n" },
        { "<leader>f", group = "Find" },
        { "<leader>l", group = "LSP" },
        { "<leader>t", group = "Toggle" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Session" },
        { "<leader>n", group = "Noice" },
        { "<leader>n", group = "Noice" },
      },
      {
        mode = { "x" },
        { "<leader>g", group = "Git" },
      },
    })
  end,
}
