local H = {}

H.signs = {
  Error = "󰅚 ",
  Warn = "󰀪 ",
  Hint = "󰌶 ",
  Info = "󰋽 ",
}

H.highlight_timeout = 250

H.paths = function()
  local paths = {
    vim.fn.stdpath("data") .. "/lazy",
    vim.fn.stdpath("data") .. "/mini.files/trash",
    require("persisted.config").options.save_dir,

    -- local
    vim.env.HOME .. "/Library/CloudStorage/Dropbox/",
    vim.env.HOME .. "/Desktop/",

    -- work
    vim.env.HOME .. "/p4/cacl3/test/lib/netapp_ontap/resources/",
    vim.env.HOME .. "/.packages/",
    vim.env.HOME .. "/notes/",
    vim.env.HOME .. "/git/ontap/",
    "/x/eng/rlse/DOT/devN/test/tools/smoke/itc/conf/class_hierarchy.cnf",
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
