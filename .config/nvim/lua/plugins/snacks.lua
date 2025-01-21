local snacks = require('snacks')

snacks.setup({
  -- git
  gitbrowse = {
    open = function(url)
      vim.fn.setreg('+', url)
    end,
    remote_patterns = {
      -- https://github.com/jshu-git/dotfiles.git/blob/main/.config/nvim/lua/plugins/git/snacks.lua#L21-L21
      { '^https://github.com/(.*).git', 'https://github.com/%1' },

      -- (https://bitbucket.ngage.netapp.com)/scm/(op)/(api).git -> (https://bitbucket.ngage.netapp.com)/projects/(op)/repos/(api)/browse
      { '^(https://bitbucket%.ngage%.netapp%.com)/scm/(.*)/(.*).git$', '%1/projects/%2/repos/%3/browse' },
    },
    url_patterns = {
      ['bitbucket.ngage.netapp.com'] = {
        file = '/{file}#{line_start}-{line_end}',
      },
    },
  },

  -- pickers
  picker = {
    prompt = '',
    -- prompt = '> ',
    sources = {
      smart = { hidden = true },
      files = { hidden = true },
      recent = { hidden = true },
      grep = { hidden = true },
    },
    layout = {
      cycle = false,
      preset = 'default',
    },
    layouts = {
      default = {
        preview = false,
        layout = {
          backdrop = false,
          width = 0.8,
          height = 0.8,
          box = 'vertical',
          border = 'single',
          title = '{source}',
          title_pos = 'center',
          { win = 'input', height = 1, border = 'bottom' },
          { win = 'list', border = 'none' },
          { win = 'preview', title = '{preview}', height = 0.5, border = 'top' },
        },
      },
    },
    -- formatters = {
    --   file = { filename_first = true },
    -- },
    previewers = {
      git = { native = true },
    },
    win = {
      input = {
        keys = {
          ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          ['<Tab>'] = { 'toggle_preview', mode = { 'i', 'n' } },
          ['<C-x>'] = { 'select_and_next', mode = { 'i', 'n' } },
          ['<C-S-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
          ['<C-S-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          ['<C-space>'] = { 'cycle_win', mode = { 'i', 'n' } },
          ['<Up>'] = { 'history_back', mode = { 'i', 'n' } },
          ['<Down>'] = { 'history_forward', mode = { 'i', 'n' } },
        },
      },
      list = {
        keys = {
          ['<Tab>'] = 'toggle_preview',
          ['<C-space>'] = 'cycle_win',
        },
      },
      preview = {
        keys = {
          ['<Tab>'] = 'toggle_preview',
          ['<C-space>'] = 'cycle_win',
        },
      },
    },
  },
})

-- git
vim.keymap.set({ 'n', 'x' }, '<leader>gy', function()
  snacks.gitbrowse()
end, { desc = 'Copy URL' })
vim.keymap.set({ 'n', 'x' }, '<leader>gb', function()
  snacks.git.blame_line()
end, { desc = 'Blame' })

-- picker
local picker = snacks.picker

-- smart
vim.keymap.set('n', '<Tab>', picker.smart, { desc = 'Files (Smart)' })
vim.keymap.set('n', '<leader><Tab>', function()
  picker.smart({ filter = { cwd = vim.fn.getcwd() } })
end, { desc = 'Files (Smart) (Relative)' })

-- files
vim.keymap.set('n', '<leade>fb', picker.buffers, { desc = 'Buffers' })
-- vim.keymap.set('n', '<leader>ff', picker.files, { desc = 'Files' })
-- vim.keymap.set('n', '<leader>fF', function()
--   picker.files({ cwd = vim.fn.expand('%:p:h') })
-- end, { desc = 'Files (Relative)' })
-- vim.keymap.set('n', '<leader>fr', picker.recent, { desc = 'Files (Recent)' })
-- vim.keymap.set('n', '<leader>fR', function()
--   picker.recent({ filter = { cwd = vim.fn.getcwd() } })
-- end, { desc = 'Files (Recent) (Relative)' })

-- grep
vim.keymap.set('n', '<leader>fw', picker.grep, { desc = 'Grep Live' })
vim.keymap.set('n', '<leader>fW', function()
  picker.grep({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Grep Live (Relative)' })

-- grep (visual)
vim.keymap.set('x', '<leader>fw', picker.grep_word, { desc = 'Grep' })
vim.keymap.set('x', '<leader>fW', function()
  picker.grep_word({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Grep (Relative)' })

-- lsp
vim.keymap.set('n', 'gd', function()
  picker.lsp_definitions({ auto_confirm = false, layout = { preview = true } })
end, { desc = 'LSP: Goto Definition' })
vim.keymap.set('n', 'gr', function()
  picker.lsp_references({ auto_confirm = false, layout = { preview = true } })
end, { desc = 'LSP: Goto References' })
vim.keymap.set('n', '<leader>fd', picker.diagnostics, { desc = 'LSP: Diagnostics' })

-- misc
vim.keymap.set('n', ',', function()
  picker.lines({
    layout = {
      preview = false,
      preset = 'select',
    },
  })
  -- source = {
  --   choose = function(item)
  --     ---@diagnostic disable:param-type-mismatch
  --     local query = table.concat(pick.get_picker_query())
  --     if query ~= '' then
  --       vim.fn.setreg('/', query)
  --     end
  --     pick.default_choose(item)
  --   end,
  -- },
end)
vim.keymap.set('n', "'", picker.resume)
vim.keymap.set('n', '<leader>u', function()
  picker.undo({ layout = { preview = true } })
end)

-- git
vim.keymap.set('n', '<leader>gl', function()
  picker.git_log_file({ layout = { preview = true } })
end, { desc = 'Log' })
vim.keymap.set('x', '<leader>gl', function()
  picker.git_log_line({ layout = { preview = true } })
end, { desc = 'Log' })

-- vim
vim.keymap.set('n', '<leader>fh', function()
  picker.help({ layout = { preview = true } })
end, { desc = 'Help' })
vim.keymap.set('n', '<leader>fl', function()
  picker.highlights({ layout = { preview = true } })
end, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>ft', picker.colorschemes, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>fc', picker.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fC', picker.pickers, { desc = 'Pickers' })
vim.keymap.set('n', '<leader>fa', picker.autocmds, { desc = 'Autocommands' })
vim.keymap.set('n', '<leader>fk', picker.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>"', function()
  picker.registers({ layout = { preview = true } })
end, { desc = 'Registers' })
vim.keymap.set('n', '<leader>:', function()
  picker.command_history({ layout = { preset = 'select' } })
end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', function()
  picker.search_history({ layout = { preset = 'select' } })
end, { desc = 'Search History' })
