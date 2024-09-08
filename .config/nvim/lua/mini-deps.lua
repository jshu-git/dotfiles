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
vim.keymap.set('n', '<leader>mu', deps.update, { desc = 'Update' })
vim.keymap.set('n', '<leader>mx', deps.clean, { desc = 'Clean' })
vim.keymap.set('n', '<leader>mm', '<cmd>DepsShowLog<cr><cmd>norm! G<cr>', { desc = 'Log' })
vim.keymap.set('n', '<leader>me', function()
  vim.cmd('edit' .. deps.config.path.snapshot)
end, { desc = 'Snapshot (Open)' })
vim.keymap.set('n', '<leader>mw', deps.snap_save, { desc = 'Snapshot (Set)' })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'minideps-confirm' },
  callback = function(event)
    vim.opt_local.foldlevel = 0
    vim.keymap.set('n', '<leader>w', function()
      vim.cmd('write')
      deps.snap_save()
    end, { buffer = event.buf })
  end,
})

now(function()
  -- lsp
  add({
    source = 'neovim/nvim-lspconfig',
    depends = {
      'hrsh7th/cmp-nvim-lsp',
      'folke/lazydev.nvim',
      'smjonas/inc-rename.nvim',
    },
  })
  add('stevearc/conform.nvim')
  vim.cmd('runtime! lua/plugins/lsp/*.lua')

  -- ui
  -- add('gbprod/nord.nvim')
  add('EdenEast/nightfox.nvim')
  require('plugins.colorscheme')

  -- work
  if vim.env.SSH_CLIENT ~= nil then
    add('ojroques/nvim-osc52')
    require('plugins.nvim-osc52')

    add('github/copilot.vim')
    vim.g.copilot_filetypes = {
      ['*'] = true,
      ['grug-far'] = false,
    }
    vim.keymap.set('i', '<A-l>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<A-n>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<A-p>', '<Plug>(copilot-previous)')

    add('pteroctopus/faster.nvim')
    require('faster').setup({ behaviours = { bigfile = { filesize = 0.5 } } })
  end
end)

later(function()
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
      'dmitmel/cmp-cmdline-history',
      -- ui
      'onsails/lspkind-nvim',
      -- autopairs
      'windwp/nvim-autopairs',
    },
  })
  add('monkoose/neocodeium')
  vim.cmd('runtime! lua/plugins/cmp/*.lua')

  -- ui
  add('0xAdk/full_visual_line.nvim')
  add('MeanderingProgrammer/render-markdown.nvim')
  add('OXY2DEV/helpview.nvim')
  add('utilyre/sentiment.nvim')
  add('mcauley-penney/visual-whitespace.nvim')
  add('aaron-p1/match-visual.nvim')
  add('tummetott/reticle.nvim')
  vim.cmd('runtime! lua/plugins/ui/*.lua')

  -- editing
  add('cbochs/grapple.nvim')
  add('stevearc/quicker.nvim')
  add('MagicDuck/grug-far.nvim')
  add('mbbill/undotree')
  add('monaqa/dial.nvim')
  add('numToStr/Comment.nvim')
  -- small
  add('BranimirE/fix-auto-scroll.nvim')
  add('nmac427/guess-indent.nvim')
  add('sitiom/nvim-numbertoggle')
  add('ziontee113/icon-picker.nvim')
  add('nkakouros-original/scrollofffraction.nvim')
  vim.cmd('runtime! lua/plugins/editing/*.lua')

  -- git
  add('kdheepak/lazygit.nvim')
  add({
    source = 'ruifm/gitlinker.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })
  -- add('jshu-git/blame.nvim')
  -- add('sindrets/diffview.nvim')
  vim.cmd('runtime! lua/plugins/git/*.lua')

  -- pico8
  -- add('bakudankun/pico-8.vim')
end)
