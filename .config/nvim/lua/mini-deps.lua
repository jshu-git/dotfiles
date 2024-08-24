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

now(function()
  add('olimorris/persisted.nvim')
  require('plugins.persisted')

  add('gbprod/nord.nvim')
  require('plugins.colorscheme')
  vim.cmd.colorscheme('nord')

  add('nmac427/guess-indent.nvim')
  require('guess-indent').setup({})
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

-- cmp
now(function()
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
end)
later(function()
  require('mini.pairs').setup()

  add('zbirenbaum/copilot.lua')
  require('plugins.cmp.copilot')

  add('monkoose/neocodeium')
  require('plugins.cmp.neocodeium')

  add('dmtrKovalenko/caps-word.nvim')
  local caps = require('caps-word')
  caps.setup({
    enter_callback = function()
      vim.notify('Toggled caps-word: On', vim.log.levels.INFO)
    end,
    exit_callback = function()
      vim.notify('Toggled caps-word: Off', vim.log.levels.INFO)
    end,
  })
  vim.keymap.set('i', '<C-s>', caps.toggle)
end)

-- editing
later(function()
  add('numToStr/Comment.nvim')
  require('plugins.editing.comment')

  add('monaqa/dial.nvim')
  require('plugins.editing.dial')

  add('ojroques/nvim-osc52')
  require('plugins.editing.nvim-osc52')

  add('2kabhishek/nerdy.nvim')
  vim.keymap.set(
    'n',
    '<leader>fi',
    '<cmd>Nerdy<cr>',
    { desc = 'Icons (Nerd Fonts)' }
  )

  add('tomiis4/Hypersonic.nvim')
  require('hypersonic').setup({ border = 'single', enable_cmdline = false })
  vim.keymap.set('n', 'gR', '<cmd>Hypersonic<CR>', { desc = 'Regex Help' })
  vim.keymap.set('x', 'gR', ":'<,'>Hypersonic<CR>", { desc = 'Regex Help' })
end)

-- git
later(function()
  require('plugins.git.mini-git')
  require('plugins.git.mini-diff')

  add('kdheepak/lazygit.nvim')
  require('plugins.git.lazygit')

  add('sindrets/diffview.nvim')
  require('plugins.git.diffview')

  add('jshu-git/blame.nvim')
  require('plugins.git.git-blame')

  add({
    source = 'ruifm/gitlinker.nvim',
    depends = { 'nvim-lua/plenary.nvim' },
  })
  require('plugins.git.gitlinker')
end)

-- lsp
now(function()
  add('neovim/nvim-lspconfig')
  require('plugins.lsp.nvim-lspconfig')

  add('folke/lazydev.nvim')
  require('lazydev').setup({})
end)
later(function()
  add('dnlhc/glance.nvim')
  require('plugins.lsp.glance')

  add('stevearc/conform.nvim')
  require('plugins.lsp.conform')

  add('stevearc/aerial.nvim')
  require('plugins.lsp.aerial')

  add('smjonas/inc-rename.nvim')
  require('inc_rename').setup({
    preview_empty_name = true,
    save_in_cmdline_history = false,
  })
end)

-- navigation
later(function()
  add('BranimirE/fix-auto-scroll.nvim')
  require('fix-auto-scroll').setup()

  add('chrisgrieser/nvim-early-retirement')
  require('early-retirement').setup({})

  -- mini.move
  require('mini.move').setup({
    -- can't use alt because of escape sending alt https://github.com/LunarVim/LunarVim/issues/1857
    mappings = {
      left = 'H',
      right = 'L',
      down = 'J',
      up = 'K',
      line_left = 'H',
      line_right = 'L',
      line_down = 'J',
      line_up = 'K',
    },
  })

  -- mini.jump2d
  local jump2d = require('mini.jump2d')
  jump2d.setup({
    mappings = {
      start_jumping = '',
    },
  })
  -- jump to any word
  vim.keymap.set({ 'n', 'x', 'o' }, 'gw', function()
    local opts = vim.tbl_deep_extend('force', jump2d.builtin_opts.word_start, {
      view = { n_steps_ahead = 1 },
    })
    jump2d.start(opts)
  end, { desc = 'Jump (Word)' })
  -- jump to punctuation
  vim.keymap.set({ 'n', 'x', 'o' }, 'g.', function()
    jump2d.start({
      spotter = jump2d.gen_pattern_spotter('%p+'),
      allowed_lines = { blank = false },
    })
  end, { desc = 'Jump (Punctuation)' })

  -- mini.jump
  require('mini.jump').setup({
    mappings = {
      repeat_jump = '', -- defaults to ;
    },
    delay = {
      highlight = 0,
    },
  })

  -- mini.bufremove
  local bufremove = require('mini.bufremove')
  bufremove.setup()

  vim.keymap.set(
    'n',
    '<leader>D',
    bufremove.delete,
    { desc = 'Buffer: Delete (Smart)' }
  )

  add('cbochs/grapple.nvim')
  local grapple = require('grapple')
  grapple.setup({
    -- style = 'basename',
    win_opts = {
      width = 0.5,
      height = 0.25,
    },
  })
  vim.keymap.set('n', '<leader>a', function()
    if grapple.exists() then
      vim.notify('Ungrappled')
    else
      vim.notify('Grappled: ' .. vim.fn.expand('%:t'))
    end
    grapple.toggle()
  end, { desc = 'Grapple' })
  vim.keymap.set('n', '<Tab>', grapple.toggle_tags)
  -- -- highlights
  -- -- has to go here since lazy loaded
  -- require('config.utils').apply_highlights({
  --   GrappleFooter = { link = 'FloatBorder' },
  --   GrappleCurrent = { link = 'Normal' },
  --   -- GrappleName = { link = 'CursorLine' },
  -- })
end)

-- operators
later(function()
  add('MagicDuck/grug-far.nvim')
  require('plugins.operators.grug-far')

  add('chrisgrieser/nvim-rip-substitute')
  require('plugins.operators.nvim-rip-substitute')

  add('gbprod/substitute.nvim')
  require('plugins.operators.substitute')

  add('NStefan002/visual-surround.nvim')
  require('visual-surround').setup({
    surround_chars = { '{', '[', '(', "'", '"', '`', '<' },
  })

  -- mini.ai
  require('plugins.operators.mini-ai')

  -- mini.splitjoin
  require('mini.splitjoin').setup({ mappings = { toggle = 'sj' } })

  -- mini.operators
  local operators = require('mini.operators')
  operators.setup({
    evaluate = { prefix = 'se' },
    exchange = { prefix = 'sx' },
    multiply = { prefix = 'sm' },
    replace = { prefix = '' }, -- using substitute.nvim for highlight
    sort = { prefix = 'so' },
  })

  -- mini.surround
  local surround = require('mini.surround')
  surround.setup({
    mappings = {
      add = 'sS',
      delete = 'sd',
      replace = 'sr',
      update_n_lines = '',
      highlight = '',
      find = '',
      find_left = '',
      suffix_last = '',
      suffix_next = '',
    },
    n_lines = 200,
    respect_selection_type = true,
  })

  -- mini.align
  require('mini.align').setup({
    mappings = { start = '&', start_with_preview = 'sA' },
    -- j cycles
    modifiers = {
      j = function(_, opts)
        local next_option = ({
          left = 'center',
          center = 'right',
          right = 'none',
          none = 'left',
        })[opts.justify_side]
        opts.justify_side = next_option or 'left'
      end,
    },
  })
end)

-- ui
now(function()
  add('nvim-lualine/lualine.nvim')
  require('plugins.ui.lualine')

  local icons = require('mini.icons')
  icons.setup({
    filetype = {
      minifiles = { glyph = '󰉋', hl = 'Directory' },
      minipick = { glyph = '󰍉' },
    },
  })
  icons.mock_nvim_web_devicons()
end)
later(function()
  add('MeanderingProgrammer/render-markdown.nvim')
  vim.keymap.set(
    'n',
    '<leader>tv',
    '<cmd>RenderMarkdown toggle<cr>',
    { desc = 'Toggle Markdown' }
  )

  -- mini.trailspace
  local trailspace = require('mini.trailspace')
  trailspace.setup()
  vim.keymap.set(
    'n',
    '<leader>T',
    trailspace.trim,
    { desc = 'Trim Trailspace' }
  )

  add('nkakouros-original/scrollofffraction.nvim')
  require('scrollofffraction').setup({ scrolloff_fraction = 0.3 })

  add({
    source = 'OXY2DEV/helpview.nvim',
    depends = { 'nvim-treesitter/nvim-treesitter' },
  })
  vim.keymap.set(
    'n',
    '<leader>tH',
    '<cmd>Helpview toggleAll<CR>',
    { desc = 'Toggle Helpview' }
  )

  add('luukvbaal/statuscol.nvim')
  require('statuscol').setup({ relculright = true })

  add('utilyre/sentiment.nvim')
  require('sentiment').setup({
    delay = 0,
    pairs = { { '(', ')' }, { '{', '}' }, { '[', ']' }, { '<', '>' } },
  })

  add('sitiom/nvim-numbertoggle')

  add('dstein64/nvim-scrollview')
  require('scrollview').setup({
    signs_on_startup = { 'search' },
    search_symbol = '—',
  })

  require('mini.indentscope').setup({
    draw = {
      animation = function()
        return 0
      end,
    },
    options = {
      indent_at_cursor = false,
      try_as_border = true,
    },
    symbol = '▏',
  })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = {
      'help',
      'lazy',
      'noice',
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
  require('config.utils').apply_highlights({
    MiniIndentScopeSymbol = { link = 'NonText' },
  })

  local hipatterns = require('mini.hipatterns')
  hipatterns.setup({
    highlighters = { hex_color = hipatterns.gen_highlighter.hex_color() },
  })

  add('gbprod/yanky.nvim')
  local actions = require('yanky.picker').actions
  require('yanky').setup({
    picker = {
      select = {
        action = actions.set_register('+'),
      },
    },
    highlight = {
      timer = require('config.utils').highlight_timeout,
    },
  })
  vim.keymap.set({ 'n', 'x' }, 'y', '<Plug>(YankyYank)')
  vim.keymap.set('n', 'p', '<Plug>(YankyPutAfter)')
  vim.keymap.set('n', 'P', '<Plug>(YankyPutIndentAfterLinewise)')
  vim.keymap.set(
    'n',
    '<leader>y',
    '<cmd>YankyRingHistory<CR>',
    { desc = 'Yank History' }
  )

  add('stevearc/quicker.nvim')
  require('plugins.ui.quicker')

  add('0xAdk/full_visual_line.nvim')
  require('full_visual_line').setup({})

  -- mini.clue
  require('plugins.ui.mini-clue')

  add('moyiz/command-and-cursor.nvim')
  require('command_and_cursor').setup({
    hl_group = 'Visual',
    inclusive = false,
  })

  add('briangwaltney/paren-hint.nvim')
  require('paren-hint').setup({
    highlight = 'NonText',
    excluded_filetypes = {},
    excluded_buftypes = {},
  })

  require('mini.cursorword').setup({
    delay = 0,
  })
  vim.g.minicursorword_disable = true
  vim.keymap.set('n', 'gh', function()
    vim.g.minicursorword_disable = not vim.g.minicursorword_disable
    -- hack
    vim.api.nvim_command('normal! l')
    vim.defer_fn(function()
      vim.api.nvim_command('normal! h')
    end, 1)
  end, { desc = 'mini.cursorword' })

  add('tzachar/highlight-undo.nvim')
  require('highlight-undo').setup({
    duration = require('config.utils').highlight_timeout,
    undo = {
      hlgroup = 'Search',
      mode = 'n',
      lhs = 'u',
      map = 'undo',
      opts = {},
    },
    redo = {
      hlgroup = 'Search',
      mode = 'n',
      lhs = 'U',
      map = 'redo',
      opts = {},
    },
  })

  add({
    source = 'folke/noice.nvim',
    depends = { 'MunifTanjim/nui.nvim' },
  })
  require('plugins.ui.noice')
end)
