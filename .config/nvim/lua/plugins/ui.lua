return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[ welcome. ]]
      opts.config.header = vim.split(logo, "\n", { trimempty = true })
      opts.config.center = {
        {
          action = "Telescope find_files",
          desc = " find file",
          icon = " ",
          key = "f",
        },
        {
          action = "Telescope file_browser",
          desc = " browse files",
          icon = " ",
          key = "b",
        },
        {
          action = "Telescope oldfiles",
          desc = " recent files",
          icon = " ",
          key = "r",
        },
        {
          action = "Lazy",
          desc = " lazy",
          icon = "󰒲 ",
          key = "l",
        },
        {
          action = "qa",
          desc = " quit",
          icon = " ",
          key = "q",
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", false },
      { "<leader>bP", false },
      { "<leader>bo", false },
      { "<leader>br", false },
      { "<leader>bl", false },
      { "[b", false },
      { "]b", false },
    },
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "folke/noice.nvim",
    keys = {
      { "<leader>snl", false },
      { "<leader>snh", false },
      { "<leader>sna", false },
      { "<leader>snd", false },
    },
  },
}
