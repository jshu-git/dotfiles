local H = {}

-- https://nanotipsforvim.prose.sh/using-pcall-to-make-your-config-more-stable
-- H.safe_require = function(module)
--   local success, errMsg = pcall(require, module)
--   if not success then
--     local msg = ('Error loading %q: %s'):format(module, errMsg)
--     vim.defer_fn(function()
--       vim.notify(msg, vim.log.levels.ERROR)
--     end, 1000)
--   end
-- end

-- ui
H.highlight_timeout = 250
H.signs = {
  Error = '󰅚 ',
  Warn = '󰀪 ',
  Hint = '󰌶 ',
  Info = '󰋽 ',
}
H.popup = {
  height = math.floor(0.75 * vim.o.lines),
  width = math.floor(0.75 * vim.o.columns),
}
H.border = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

return H
