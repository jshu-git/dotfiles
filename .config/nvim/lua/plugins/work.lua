if vim.env.SSH_CLIENT == nil then
  return
end

-- currently, zellij supports OSC52 copy (copy_command), but not paste
-- copying to system clipboard works from neovim to outside works fine
--  links:
--    https://zellij.dev/documentation/options.html?highlight=copy_command#copy_command
--    https://github.com/zellij-org/zellij/issues/2637
--    https://github.com/zellij-org/zellij/issues/2647
--    https://github.com/zellij-org/zellij/issues/3135
--    https://github.com/theimpostor/osc?tab=readme-ov-file#terminal-multiplexer-support

-- so the following neovim snippet hangs when using 'p' to paste from outside
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--   },
-- }

-- the workaround is to use this plugin, and use command-v for pasting from outside

local osc52 = require('osc52')
osc52.setup({ silent = true })
local function copy(lines, _)
  osc52.copy(table.concat(lines, '\n'))
end
local function paste()
  return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
end
vim.g.clipboard = {
  name = 'osc52',
  copy = {
    ['+'] = copy,
    ['*'] = copy,
  },
  paste = {
    ['+'] = paste,
    ['*'] = paste,
  },
}

-- gitlinker

local gitlinker = require('gitlinker')
local actions = require('gitlinker.actions')
require('gitlinker').setup({
  mappings = nil,
  callbacks = {
    ['bitbucket.ngage.netapp.com'] = function(url_data)
      -- https://bitbucket.ngage.netapp.com/scm/op/api
      local url = require('gitlinker.hosts').get_base_https_url(url_data)

      -- https://bitbucket.ngage.netapp.com/projects/op/api
      url = url:gsub('/scm/', '/projects/')

      -- https://bitbucket.ngage.netapp.com/projects/op/repos/api
      local parts = vim.split(url, '/')
      table.insert(parts, #parts, 'repos')
      url = table.concat(parts, '/')

      -- https://bitbucket.ngage.netapp.com/projects/repos/op/api/ .. /browse/ .. ontap/api/__init__.py
      url = url .. '/browse/' .. url_data.file

      -- line numbers
      if url_data.lstart then
        url = url .. '#' .. url_data.lstart
      end
      if url_data.lend then
        url = url .. '-' .. url_data.lend
      end
      return url
    end,
  },
})

-- copy url
vim.keymap.set('n', '<leader>gy', function()
  gitlinker.get_buf_range_url('n', { action_callback = actions.copy_to_clipboard })
end, { desc = 'Yank Git URL' })
vim.keymap.set('v', '<leader>gy', function()
  gitlinker.get_buf_range_url('v', { action_callback = actions.copy_to_clipboard })
end, { desc = 'Yank Git URL' })

-- open in browser
vim.keymap.set('n', '<leader>gx', function()
  gitlinker.get_buf_range_url('n', { action_callback = actions.open_in_browser })
end, { desc = 'Open Git URL', silent = true })
vim.keymap.set('v', '<leader>gx', function()
  gitlinker.get_buf_range_url('v', { action_callback = actions.open_in_browser })
end, { desc = 'Open Git URL', silent = true })

-- copilot
-- vim.g.copilot_filetypes = { ['*'] = true }
-- vim.keymap.set('i', '<A-l>', '<Plug>(copilot-accept-word)')
-- vim.keymap.set('i', '<A-n>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<A-p>', '<Plug>(copilot-previous)')
