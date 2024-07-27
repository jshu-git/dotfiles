return {
  "nvim-treesitter/nvim-treesitter",
  cond = vim.env.SSH_CLIENT == nil,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
    })
  end,
}
