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
vim.keymap.set('n', '<leader>ll', function()
  vim.cmd('edit' .. deps.config.path.snapshot)
end, { desc = 'Deps: Snapshot' })
vim.keymap.set(
  'n',
  '<leader>lw',
  deps.snap_save,
  { desc = 'Deps: Snapshot (Set)' }
)

now(function()
  add('olimorris/persisted.nvim')
  require('plugins.persisted')

  add('gbprod/nord.nvim')
  require('plugins.colorscheme')
  vim.cmd.colorscheme('nord')
end)

later(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    depends = { 'nvim-treesitter/nvim-treesitter-context' },
  })
  require('plugins.nvim-treesitter')

  require('plugins.mini-files')
  require('plugins.mini-pick')

  require('mini.extra').setup()
  local misc = require('mini.misc')
  misc.setup_restore_cursor()
  misc.setup_termbg_sync()
  vim.keymap.set('n', '<C-w>m', misc.zoom, { desc = 'Toggle Maximize' })
end)

-- lsp
now(function()
  add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'hrsh7th/cmp-nvim-lsp' },
  })
  require('plugins.lsp.nvim-lspconfig')

  add('folke/lazydev.nvim')
  require('lazydev').setup({})

  add('dnlhc/glance.nvim')
  require('plugins.lsp.glance')
end)
later(function()
  add('stevearc/conform.nvim')
  require('plugins.lsp.conform')

  add('stevearc/aerial.nvim')
  require('plugins.lsp.aerial')

  add('smjonas/inc-rename.nvim')
  require('plugins.lsp.inc-rename')
end)

-- cmp
later(function()
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
  require('plugins.cmp.nvim-cmp')

  require('plugins.cmp.mini-pairs')

  add('monkoose/neocodeium')
  require('plugins.cmp.neocodeium')

  add('dmtrKovalenko/caps-word.nvim')
  require('plugins.cmp.caps-word')

  -- work
  add('zbirenbaum/copilot.lua')
  require('plugins.cmp.copilot')
end)

-- ui
now(function()
  add('nvim-lualine/lualine.nvim')
  require('plugins.ui.lualine')

  require('plugins.ui.mini-icons')

  add('sitiom/nvim-numbertoggle')
end)
later(function()
  require('plugins.ui.mini-clue')
  require('plugins.ui.mini-indentscope')
  require('plugins.ui.mini-hipatterns')
  require('plugins.ui.mini-trailspace')
  require('plugins.ui.mini-cursorword')

  add('MeanderingProgrammer/render-markdown.nvim')
  require('plugins.ui.render-markdown')

  add('nkakouros-original/scrollofffraction.nvim')
  require('plugins.ui.scrollofffraction')

  add('OXY2DEV/helpview.nvim')
  require('plugins.ui.helpview')

  add('luukvbaal/statuscol.nvim')
  require('plugins.ui.statuscol')

  add('utilyre/sentiment.nvim')
  require('plugins.ui.sentiment')

  add('dstein64/nvim-scrollview')
  require('plugins.ui.nvim-scrollview')

  add('stevearc/quicker.nvim')
  require('plugins.ui.quicker')

  add('0xAdk/full_visual_line.nvim')
  require('plugins.ui.full_visual_line')

  add('moyiz/command-and-cursor.nvim')
  require('plugins.ui.command-and-cursor')

  add('briangwaltney/paren-hint.nvim')
  require('plugins.ui.paren-hint')

  add('tzachar/highlight-undo.nvim')
  require('plugins.ui.highlight-undo')

  add({
    source = 'folke/noice.nvim',
    depends = { 'MunifTanjim/nui.nvim' },
  })
  require('plugins.ui.noice')
end)

-- navigation
now(function()
  require('plugins.navigation.mini-move')
end)
later(function()
  require('plugins.navigation.mini-jump')
  require('plugins.navigation.mini-jump2d')

  add('cbochs/grapple.nvim')
  require('plugins.navigation.grapple')

  add('BranimirE/fix-auto-scroll.nvim')
  require('plugins.navigation.fix-auto-scroll')

  add('chrisgrieser/nvim-early-retirement')
  require('plugins.navigation.nvim-early-retirement')
end)

-- editing
now(function()
  add('nmac427/guess-indent.nvim')
  require('plugins.editing.guess-indent')
end)
later(function()
  add('numToStr/Comment.nvim')
  require('plugins.editing.comment')

  add('monaqa/dial.nvim')
  require('plugins.editing.dial')

  add('MagicDuck/grug-far.nvim')
  require('plugins.editing.grug-far')

  add('tomiis4/Hypersonic.nvim')
  require('plugins.editing.hypersonic')

  add('2kabhishek/nerdy.nvim')
  require('plugins.editing.nerdy')

  add('mbbill/undotree')
  require('plugins.editing.undotree')

  add('gbprod/yanky.nvim')
  require('plugins.editing.yanky')

  -- work
  add('ojroques/nvim-osc52')
  require('plugins.editing.nvim-osc52')
end)

-- operators
later(function()
  require('plugins.operators.mini-ai')
  require('plugins.operators.mini-splitjoin')
  require('plugins.operators.mini-operators')
  require('plugins.operators.mini-surround')
  require('plugins.operators.mini-align')

  add('chrisgrieser/nvim-rip-substitute')
  require('plugins.operators.nvim-rip-substitute')

  add('gbprod/substitute.nvim')
  require('plugins.operators.substitute')

  add('NStefan002/visual-surround.nvim')
  require('plugins.operators.visual-surround')
end)

-- git
later(function()
  require('plugins.git.mini-diff')
  require('plugins.git.mini-git')

  add('sindrets/diffview.nvim')
  require('plugins.git.diffview')

  add('jshu-git/blame.nvim')
  require('plugins.git.git-blame')

  add({
    source = 'ruifm/gitlinker.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })
  require('plugins.git.gitlinker')

  add('kdheepak/lazygit.nvim')
  require('plugins.git.lazygit')
end)
