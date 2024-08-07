local H = {}

-- ui
H.highlight_timeout = 250
H.signs = { Error = '󰅚 ', Warn = '󰀪 ', Hint = '󰌶 ', Info = '󰋽 ' }
H.popup = {
  height = math.floor(0.8 * vim.o.lines),
  width = math.floor(0.8 * vim.o.columns),
}
H.border = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

-- work related
-- not working for some reason
-- H.is_work = function()
--   if vim.env.HOME ~= nil then
--     return false
--   end
--   return true
-- end

H.paths = function()
  local data = vim.fn.stdpath('data')
  local lazy = data .. '/lazy'
  local home = vim.env.HOME

  local paths = {
    -- nvim
    data .. '/mini.files/trash',
    data .. '/sessions',
    vim.fn.stdpath('state'),
    lazy,
    lazy .. '/nvim-treesitter/parser',

    -- local
    home .. '/Library/CloudStorage/Dropbox/',
    home .. '/Desktop/',

    -- work
    home .. '/p4/cacl3/test/lib/netapp_ontap/resources/',
    home .. '/.packages/',
    home .. '/notes/',
    home .. '/git/ontap/',
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
