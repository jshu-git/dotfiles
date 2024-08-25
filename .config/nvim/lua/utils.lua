local H = {}

-- https://nanotipsforvim.prose.sh/using-pcall-to-make-your-config-more-stable
H.safe_require = function(module)
  local success, errMsg = pcall(require, module)
  if not success then
    local msg = ('Error loading %q: %s'):format(module, errMsg)
    vim.defer_fn(function()
      vim.notify(msg, vim.log.levels.ERROR)
    end, 1000)
  end
end

-- ui
H.highlight_timeout = 250
H.signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = '󰋽 ' }
H.popup = {
  height = math.floor(0.75 * vim.o.lines),
  width = math.floor(0.75 * vim.o.columns),
}
H.border = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
H.apply_highlights = function(highlights)
  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

H.paths = function()
  local data = vim.fn.stdpath('data')
  local home = vim.env.HOME

  local paths = {
    -- nvim
    data,
    data .. '/mini.files/trash',
    vim.fn.stdpath('state'),

    -- local
    home .. '/Library/CloudStorage/Dropbox/',
    home .. '/Desktop/',

    -- work
    home .. '/.packages/',
    home .. '/notes/',
    home .. '/git/ontap/',
    '/x/eng/rlse/DOT/devN/test/lib/netapp_ontap/resources/',
    '/x/eng/rlse/DOT/devN/test/tools/smoke/itc/conf/class_hierarchy.cnf',
  }

  local existing_paths = {}
  for _, path in ipairs(paths) do
    if vim.fn.isdirectory(path) ~= 0 then
      table.insert(existing_paths, path)
    end
  end

  table.sort(existing_paths)
  return existing_paths
end

-- work related
-- not working for some reason
-- H.is_work = function()
--   if vim.env.HOME ~= nil then
--     return false
--   end
--   return true
-- end

return H
