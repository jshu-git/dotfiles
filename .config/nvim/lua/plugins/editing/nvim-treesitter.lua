-- work
if vim.env.SSH_CLIENT ~= nil then
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  for lang, files in pairs({
    python = { 'src/parser.c', 'src/scanner.c' },
    yaml = { 'src/parser.c', 'src/scanner.cc' },
    perl = { 'src/parser.c', 'src/scanner.c' },
    http = { 'src/parser.c' },
    json = { 'src/parser.c' },
  }) do
    parser_config[lang] = {
      install_info = {
        url = vim.env.HOME .. '/.packages/grammars/tree-sitter-' .. lang,
        files = files,
      },
    }
  end
end

require('nvim-treesitter.configs').setup({
  ensure_installed = { 'python', 'yaml', 'perl', 'http', 'json' },
  auto_install = vim.env.SSH_CLIENT == nil,
  ignore_install = { 'tmux' },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'm',
      node_incremental = 'm',
      scope_incremental = false,
      node_decremental = 'M',
    },
  },
  highlight = { enable = true },
})

local context = require('treesitter-context')
context.setup({ max_lines = 1 })
vim.keymap.set('n', 'gt', function()
  context.go_to_context(vim.v.count1)
end, { desc = 'Goto Treesitter Context' })
