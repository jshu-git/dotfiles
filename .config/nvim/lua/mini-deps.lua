local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(mini_path) then
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
end

local deps = require('mini.deps')
local add, now, later = deps.add, deps.now, deps.later
deps.setup({ path = { package = path_package } })
vim.keymap.set('n', '<leader>lu', deps.update, { desc = 'Deps: Update' })
vim.keymap.set('n', '<leader>lx', deps.clean, { desc = 'Deps: Clean' })
-- vim.keymap.set('n', '<leader>ls', deps.snap_get, { desc = 'Deps: Snapshot' })
vim.keymap.set(
  'n',
  '<leader>lw',
  deps.snap_save,
  { desc = 'Deps: Snapshot (Set)' }
)

require('plugins.persisted')
require('plugins.colorscheme')
require('plugins.nvim-treesitter')
require('plugins.mini-files')
require('plugins.mini-pick')

later(function()
  require('mini.extra').setup()

  local misc = require('mini.misc')
  misc.setup_restore_cursor()
  misc.setup_termbg_sync()
  vim.keymap.set('n', '<C-w>m', misc.zoom, { desc = 'Toggle Maximize' })
end)

vim.cmd('runtime! lua/plugins/cmp/*.lua')
vim.cmd('runtime! lua/plugins/editing/*.lua')
vim.cmd('runtime! lua/plugins/git/*.lua')
vim.cmd('runtime! lua/plugins/lsp/*.lua')
vim.cmd('runtime! lua/plugins/navigation/*.lua')
vim.cmd('runtime! lua/plugins/operators/*.lua')
vim.cmd('runtime! lua/plugins/ui/*.lua')
