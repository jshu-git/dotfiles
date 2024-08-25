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
vim.keymap.set('n', '<leader>ll', '<cmd>DepsShowLog<cr>', { desc = 'Deps: Log' })
vim.keymap.set('n', '<leader>le', function()
  vim.cmd('edit' .. deps.config.path.snapshot)
end, { desc = 'Deps: Snapshot' })
vim.keymap.set('n', '<leader>lw', deps.snap_save, { desc = 'Deps: Snapshot (Set)' })

now(function()
  -- session manager
  -- add('olimorris/persisted.nvim')
  -- require('plugins.persisted')

  -- ui
  add('gbprod/nord.nvim')
  require('plugins.colorscheme')

  add('nvim-lualine/lualine.nvim')
  require('plugins.lualine')

  local icons = require('mini.icons')
  icons.setup({
    filetype = {
      minifiles = { glyph = '󰉋', hl = 'Directory' },
      minipick = { glyph = '󰍉' },
      ['mininotify-history'] = { glyph = '󰋚' },
    },
  })
  icons.mock_nvim_web_devicons()

  -- work
  add('ojroques/nvim-osc52')
  require('plugins.editing.nvim-osc52')
end)

later(function()
  -- mini
  require('mini.extra').setup()
  local misc = require('mini.misc')
  misc.setup_restore_cursor()
  misc.setup_termbg_sync()
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
      'dnlhc/glance.nvim',
      'smjonas/inc-rename.nvim',
    },
  })
  add('stevearc/aerial.nvim')
  add('stevearc/conform.nvim')
  vim.cmd('runtime! lua/plugins/lsp/*.lua')

  -- cmp
  add({
    source = 'hrsh7th/nvim-cmp',
    depends = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'FelipeLema/cmp-async-path',
      -- cmdline
      'hrsh7th/cmp-cmdline',
      'dmitmel/cmp-cmdline-history',
      -- signature
      'hrsh7th/cmp-nvim-lsp-signature-help',
      -- ui
      'onsails/lspkind-nvim',
    },
  })
  add('monkoose/neocodeium')
  add('windwp/nvim-autopairs')
  -- add('dmtrKovalenko/caps-word.nvim')
  -- work
  add('zbirenbaum/copilot.lua')
  vim.cmd('runtime! lua/plugins/cmp/*.lua')

  -- ui
  add('0xAdk/full_visual_line.nvim')
  add('MeanderingProgrammer/render-markdown.nvim')
  add('OXY2DEV/helpview.nvim')
  add('briangwaltney/paren-hint.nvim')
  add('dstein64/nvim-scrollview')
  add('nkakouros-original/scrollofffraction.nvim')
  add('stevearc/quicker.nvim')
  add('utilyre/sentiment.nvim')
  -- add({
  --   source = 'folke/noice.nvim',
  --   depends = { 'MunifTanjim/nui.nvim' },
  -- })
  -- add('luukvbaal/statuscol.nvim')
  -- add('moyiz/command-and-cursor.nvim')
  -- add('tzachar/highlight-undo.nvim')
  vim.cmd('runtime! lua/plugins/ui/*.lua')

  -- editing
  add('sitiom/nvim-numbertoggle')
  add('nmac427/guess-indent.nvim')
  add('2kabhishek/nerdy.nvim')
  add('BranimirE/fix-auto-scroll.nvim')
  add('MagicDuck/grug-far.nvim')
  add('cbochs/grapple.nvim')
  add('mbbill/undotree')
  add('monaqa/dial.nvim')
  add('numToStr/Comment.nvim')
  add('tomiis4/Hypersonic.nvim')
  -- add('chrisgrieser/nvim-early-retirement')
  -- add('gbprod/yanky.nvim')
  -- add('chrisgrieser/nvim-rip-substitute')
  vim.cmd('runtime! lua/plugins/editing/*.lua')

  -- operators
  -- add('NStefan002/visual-surround.nvim')
  -- add('gbprod/substitute.nvim')
  vim.cmd('runtime! lua/plugins/operators/*.lua')

  -- git
  add('sindrets/diffview.nvim')
  add('jshu-git/blame.nvim')
  add('kdheepak/lazygit.nvim')
  add({
    source = 'ruifm/gitlinker.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })
  vim.cmd('runtime! lua/plugins/git/*.lua')
end)
