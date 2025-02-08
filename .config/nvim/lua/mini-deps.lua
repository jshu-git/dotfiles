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
  add('gbprod/nord.nvim')
  require('plugins.nord')
  vim.cmd.colorscheme('nord')
end)

later(function()
  -- work
  add('ojroques/nvim-osc52')
  if vim.env.SSH_CLIENT ~= nil then
    require('plugins.nvim-osc52')
  end

  -- ai completion
  add('zbirenbaum/copilot.lua')
  add('codota/tabnine-nvim')
  add('monkoose/neocodeium')
  if vim.env.SSH_CLIENT ~= nil then
    -- require('plugins.tabnine')
    -- require('plugins.copilot')
  else
    require('plugins.neocodeium')
  end

  -- lsp
  add({
    source = 'neovim/nvim-lspconfig',
    depends = {
      'folke/lazydev.nvim',
      { source = 'saghen/blink.cmp', checkout = 'v0.11.0' },
    },
  })
  add('stevearc/conform.nvim')
  add('rachartier/tiny-inline-diagnostic.nvim')
  vim.cmd('runtime! lua/plugins/lsp/*')

  -- cmp
  add('windwp/nvim-autopairs')
  vim.cmd('runtime! lua/plugins/cmp/*')

  -- ui
  add('utilyre/sentiment.nvim')
  add('BranimirE/fix-auto-scroll.nvim')
  vim.cmd('runtime! lua/plugins/ui/*')

  -- editing
  add('nvim-treesitter/nvim-treesitter')
  add('nvim-treesitter/nvim-treesitter-context')
  add('numToStr/Comment.nvim')
  add('nmac427/guess-indent.nvim')
  add('chrisgrieser/nvim-rip-substitute')
  add('SunnyTamang/select-undo.nvim')
  add('stevearc/quicker.nvim')
  vim.cmd('runtime! lua/plugins/editing/*')

  -- snacks
  add('folke/snacks.nvim')
  require('plugins.snacks')

  -- git
  vim.cmd('runtime! lua/plugins/git/*')

  -- leetcode
  if vim.env.SSH_CLIENT == nil then
    -- add({
    --   source = 'kawre/leetcode.nvim',
    --   depends = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
    -- })
    -- require('leetcode').setup({
    --   lang = 'python3',
    --   injector = {
    --     ['python3'] = {
    --       before = { 'from pprint import pprint' },
    --     },
    --   },
    --   console = {
    --     result = { size = '50%' },
    --     testcase = { size = '50%' },
    --   },
    --   description = { width = '50%' },
    -- })
    -- vim.keymap.set('n', '<leader>L', '<cmd>Leet<cr>')
    -- vim.keymap.set('n', '<leader>fL', '<cmd>Leet list difficulty=easy<cr>')
  end
end)
