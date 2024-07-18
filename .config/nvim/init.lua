if vim.env.SSH_CLIENT ~= nil then
  vim.g.editorconfig = false
end

-- https://nanotipsforvim.prose.sh/using-pcall-to-make-your-config-more-stable
local function safe_require(module)
  local success, errMsg = pcall(require, module)
  if not success then
    local msg = ("Error loading %q: %s"):format(module, errMsg)
    vim.defer_fn(function()
      vim.notify(msg, vim.log.levels.ERROR)
    end, 1000)
  end
end
safe_require("config.options")
safe_require("config.autocommands")
safe_require("config.keymaps")
safe_require("config.lazy")
