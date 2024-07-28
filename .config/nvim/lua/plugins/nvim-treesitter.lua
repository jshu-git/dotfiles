return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = 1 } },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      auto_install = true,
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'm',
          node_incremental = 'm',
          scope_incremental = false,
          node_decremental = 'M',
        },
      },
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true,
      --     keymaps = {
      --       ["af"] = "@function.outer",
      --       ["if"] = "@function.inner",
      --       ["ac"] = "@conditional.outer",
      --       ["ic"] = "@conditional.inner",
      --       ["al"] = "@loop.outer",
      --       ["il"] = "@loop.inner",
      --
      --       ["aC"] = "@class.outer",
      --       ["iC"] = "@class.inner",
      --     },
      --   },
      -- },
    })
  end,
}
