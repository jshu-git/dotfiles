return {
  {
    "rockyzhang24/arctic.nvim",
    name = "arctic",
    lazy = false,
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim",
    },
    config = function()
      vim.cmd.colorscheme("arctic")
    end,
  },
}
