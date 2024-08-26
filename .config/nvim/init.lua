if vim.env.SSH_CLIENT ~= nil then
  vim.g.editorconfig = false
end

vim.loader.enable()
vim.g.loaded_fzf = 1
vim.g.loaded_gzip = 1
vim.g.loaded_matchit = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_remote_plugins = 1
vim.g.loaded_python3_provider = 0
vim.g.loaded_tutor_mode_plugin = 1

local safe_require = require('utils').safe_require
safe_require('config.options')
safe_require('config.autocommands')
safe_require('config.keymaps')
safe_require('config.filetypes')
safe_require('mini-deps')
