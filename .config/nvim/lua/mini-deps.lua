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
vim.keymap.set('n', '<leader>mu', function()
  deps.update()
  vim.cmd('norm! zj')
end, { desc = 'Update' })
vim.keymap.set('n', '<leader>mx', deps.clean, { desc = 'Clean' })
vim.keymap.set('n', '<leader>ml', '<cmd>DepsShowLog<cr><cmd>norm! G<cr>', { desc = 'Log' })
vim.keymap.set('n', '<leader>me', function()
  vim.cmd('edit' .. deps.config.path.snapshot)
end, { desc = 'Snapshot (Open)' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'minideps-confirm' },
  callback = function(event)
    vim.wo.foldlevel = 0
    vim.keymap.set('n', '<leader>w', function()
      vim.cmd('write')
      deps.snap_save()
    end, { buffer = event.buf })
  end,
})

now(function()
  add({ source = 'catppuccin/nvim', name = 'catppuccin' })
  require('plugins.colorscheme')
  vim.cmd.colorscheme('catppuccin-mocha')
  vim.api.nvim_set_hl(0, 'MiniIndentScopeSymbol', { link = 'NonText' })
end)

later(function()
  -- work
  add('ojroques/nvim-osc52')
  add({ source = 'ruifm/gitlinker.nvim', depends = { 'nvim-lua/plenary.nvim' } })
  require('plugins.work')

  -- treesitter
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    depends = { 'nvim-treesitter/nvim-treesitter-context' },
  })
  require('plugins.nvim-treesitter')

  -- lsp
  add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'folke/lazydev.nvim' },
  })
  add('stevearc/conform.nvim')
  require('plugins.lsp.conform')
  require('plugins.lsp.nvim-lspconfig')

  -- cmp
  add('windwp/nvim-autopairs')
  require('plugins.cmp.mini-completion')

  -- ui
  add('nkakouros-original/scrollofffraction.nvim')
  add({
    source = 'OXY2DEV/helpview.nvim',
    depends = { 'nvim-treesitter/nvim-treesitter' },
  })
  add('TaDaa/vimade')
  add('utilyre/sentiment.nvim')
  vim.cmd('runtime! lua/plugins/ui/*')

  -- editing
  add('cbochs/grapple.nvim')
  add('stevearc/quicker.nvim')
  add('mbbill/undotree')
  add('numToStr/Comment.nvim')
  add('nmac427/guess-indent.nvim')
  add('ziontee113/icon-picker.nvim')
  add({
    source = 'nvim-telescope/telescope.nvim',
    depends = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'natecraddock/telescope-zf-native.nvim',
    },
  })
  add('pteroctopus/faster.nvim')
  add('andrewferrier/debugprint.nvim')
  add('MagicDuck/grug-far.nvim')
  vim.cmd('runtime! lua/plugins/editing/*')

  -- git
  require('plugins.git.mini-diff')
  require('plugins.git.mini-git')
end)
