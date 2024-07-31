local H = {}

-- ui
H.highlight_timeout = 250
H.signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = '󰋽 ' }
H.popup = {
  height = math.floor(0.6 * vim.o.lines),
  width = math.floor(0.75 * vim.o.columns),
}
-- H.border = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

-- work related
-- not working for some reason
-- H.is_work = function()
--   if vim.env.HOME ~= nil then
--     return false
--   end
--   return true
-- end

H.paths = function()
  local paths = {
    vim.fn.stdpath('data') .. '/lazy',
    vim.fn.stdpath('data') .. '/mini.files/trash',
    require('persisted.config').options.save_dir,

    -- local
    vim.env.HOME .. '/Library/CloudStorage/Dropbox/',
    vim.env.HOME .. '/Desktop/',

    -- treesitter parsers
    vim.fn.stdpath('data')
      .. '/lazy'
      .. '/nvim-treesitter/parser',

    -- work
    vim.env.HOME .. '/p4/cacl3/test/lib/netapp_ontap/resources/',
    vim.env.HOME .. '/.packages/',
    vim.env.HOME .. '/notes/',
    vim.env.HOME .. '/git/ontap/',
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

return H
