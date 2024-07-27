return {
  "nvim-treesitter/nvim-treesitter",
  cond = vim.env.SSH_CLIENT == nil,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ao"] = "@loop.outer",
            ["io"] = "@loop.inner",
          },
        },
      },
    })
  end,
}
