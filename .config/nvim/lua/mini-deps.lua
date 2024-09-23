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
vim.keymap.set('n', '<leader>mm', '<cmd>DepsShowLog<cr><cmd>norm! G<cr>', { desc = 'Log' })
vim.keymap.set('n', '<leader>me', function()
  vim.cmd('edit' .. deps.config.path.snapshot)
end, { desc = 'Snapshot (Open)' })
vim.keymap.set('n', '<leader>mw', deps.snap_save, { desc = 'Snapshot (Set)' })
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
  add('EdenEast/nightfox.nvim')
  require('plugins.colorscheme')
end)

later(function()
  -- work
  add('ojroques/nvim-osc52')
  require('plugins.nvim-osc52')
  add({
    source = 'ruifm/gitlinker.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })
  require('plugins.gitlinker')
  -- if vim.env.SSH_CLIENT ~= nil then
  -- add('github/copilot.vim')
  -- vim.g.copilot_filetypes = { ['*'] = true, ['grug-far'] = false }
  -- vim.keymap.set('i', '<A-l>', '<Plug>(copilot-accept-word)')
  -- vim.keymap.set('i', '<A-n>', '<Plug>(copilot-next)')
  -- vim.keymap.set('i', '<A-p>', '<Plug>(copilot-previous)')
  -- add('pteroctopus/faster.nvim')
  -- require('faster').setup({ behaviours = { bigfile = { filesize = 0.3 } } })
  -- end

  -- mini
  require('mini.extra').setup()
  local misc = require('mini.misc')
  misc.setup_restore_cursor()
  vim.keymap.set('n', '<C-w>m', misc.zoom, { desc = 'Toggle Maximize' })

  -- treesitter
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    depends = { 'nvim-treesitter/nvim-treesitter-context' },
  })
  require('plugins.nvim-treesitter')

  -- lsp
  add({
    source = 'neovim/nvim-lspconfig',
    depends = {
      'hrsh7th/cmp-nvim-lsp',
      'folke/lazydev.nvim',
      -- 'smjonas/inc-rename.nvim',
    },
  })
  add('stevearc/conform.nvim')
  require('plugins.lsp.conform')
  require('plugins.lsp.nvim-lspconfig')

  -- cmp
  add({
    -- source = 'hrsh7th/nvim-cmp',
    -- https://old.reddit.com/r/neovim/comments/1f1rxtx/share_a_tip_to_improve_your_experience_in_nvimcmp/
    source = 'yioneko/nvim-cmp',
    checkout = 'perf',
    depends = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'FelipeLema/cmp-async-path',
      -- cmdline
      'hrsh7th/cmp-cmdline',
      -- ui
      'onsails/lspkind-nvim',
      -- autopairs
      'windwp/nvim-autopairs',
    },
  })
  require('plugins.cmp.nvim-cmp')

  -- ui
  add('0xAdk/full_visual_line.nvim')
  add('MeanderingProgrammer/render-markdown.nvim')
  add('OXY2DEV/helpview.nvim')
  add('BranimirE/fix-auto-scroll.nvim')
  add('nkakouros-original/scrollofffraction.nvim')
  add('mcauley-penney/visual-whitespace.nvim')
  add('aaron-p1/match-visual.nvim')
  -- add('utilyre/sentiment.nvim')
  -- add('sitiom/nvim-numbertoggle')
  vim.cmd('runtime! lua/plugins/ui/*.lua')

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
  vim.cmd('runtime! lua/plugins/editing/*.lua')

  -- git
  require('plugins.git.mini-diff')
  require('plugins.git.mini-git')
end)
