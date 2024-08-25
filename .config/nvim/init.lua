if vim.env.SSH_CLIENT ~= nil then
  vim.g.editorconfig = false
end

local safe_require = require('utils').safe_require
safe_require('config.options')
safe_require('config.autocommands')
safe_require('config.keymaps')
safe_require('config.filetypes')
safe_require('mini-deps')
