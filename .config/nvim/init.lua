if vim.env.SSH_CLIENT ~= nil then
  vim.g.editorconfig = false
end

vim.loader.enable()
-- plugins
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1

vim.g.did_load_ftplugin = 1

-- providers
vim.g.loaded_node_provider = 1
vim.g.loaded_perl_provider = 1
vim.g.loaded_python3_provider = 1
vim.g.loaded_ruby_provider = 1

local safe_require = require('utils').safe_require
safe_require('config.options')
safe_require('config.autocommands')
safe_require('config.keymaps')
safe_require('config.filetypes')
safe_require('mini-deps')
