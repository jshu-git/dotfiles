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
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("rose-pine").setup({
  --       styles = {
  --         bold = false,
  --         italic = false,
  --         transparency = false,
  --       },
  --     })
  --     -- vim.cmd("colorscheme rose-pine-main")
  --     -- vim.cmd("colorscheme rose-pine-moon")
  --   end,
  -- },
}
