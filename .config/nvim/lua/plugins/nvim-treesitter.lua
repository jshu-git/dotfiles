return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = 1 } },
  },
  config = function()
    -- work
    if vim.env.SSH_CLIENT ~= nil then
      local parser_config =
        require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.lua = {
        install_info = {
          url = '~/.packages/parsers/lua/',
          files = { 'src/parser.c', 'src/scanner.c' },
        },
      }
      ---@diagnostic disable-next-line: inject-field
      parser_config.python = {
        install_info = {
          url = '~/.packages/parsers/python/',
          files = { 'src/parser.c', 'src/scanner.c' },
        },
        filetype = 'py',
      }
    end

    require('nvim-treesitter.configs').setup({
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
