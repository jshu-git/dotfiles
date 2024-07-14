if vim.env.SSH_CLIENT ~= nil then
  vim.g.editorconfig = false
end
require("config.options")
require("config.autocommands")
require("config.keymaps")
require("lazy-nvim")
