return {
  "kdheepak/lazygit.nvim",
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    { "<leader>gG", "<cmd>LazyGitConfig<cr>", desc = "LazyGit (Config)" },
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1
  end,
}
