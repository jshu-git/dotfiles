return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'nvim-treesitter/nvim-treesitter-context', opts = { max_lines = 1 } },
  },
  config = function()
    -- work
    -- if vim.env.SSH_CLIENT ~= nil then
    --   local parser_config =
    --     require('nvim-treesitter.parsers').get_parser_configs()
    --   parser_config.lua = {
    --     install_info = {
    --       url = '~/.packages/parsers/lua/',
    --       files = { 'src/parser.c', 'src/scanner.c' },
    --     },
    --   }
    --   ---@diagnostic disable-next-line: inject-field
    --   parser_config.python = {
    --     install_info = {
    --       url = '~/.packages/parsers/python/',
    --       files = { 'src/parser.c', 'src/scanner.c' },
    --     },
    --     filetype = 'py',
    --   }
    -- end

    require('nvim-treesitter.configs').setup({
      auto_install = vim.env.SSH_CLIENT == nil,
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'm',
          node_incremental = 'm',
          scope_incremental = false,
          node_decremental = 'M',
        },
      },
    })

    vim.keymap.set('n', 'gt', function()
      require('treesitter-context').go_to_context(vim.v.count1)
    end, { desc = 'Goto Treesitter Context' })
  end,
}
