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
    prompt = '  > ',
    sources = {
      smart = { hidden = true },
      files = { hidden = true },
      recent = { hidden = true },
      grep = { hidden = true },
      lines = {
        layout = {
          preview = false,
          preset = 'select',
        },
      },
      lsp_definitions = { auto_confirm = false },
      lsp_references = { auto_confirm = false },
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
          { win = 'preview', height = 0.5, border = 'top' },
        },
      },
    },
    formatters = {
      file = { filename_first = true },
    },
    previewers = {
      git = { native = true },
    },
    win = {
      input = {
        keys = {
          ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
          ['<Tab>'] = { 'toggle_preview', mode = { 'i', 'n' } },
          ['<C-x>'] = { 'select_and_next', mode = { 'i', 'n' } },
          -- ['<c-d>'] = { 'list_scroll_down', mode = { 'i', 'n' } },
          -- ['<c-u>'] = { 'list_scroll_up', mode = { 'i', 'n' } },
          ['<C-S-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
          ['<C-S-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          ['<C-z>'] = { 'cycle_win', mode = { 'i', 'n' } },
        },
      },
      list = {
        keys = {
          ['<Tab>'] = 'toggle_preview',
          ['<C-z>'] = 'cycle_win',
        },
      },
      preview = {
        keys = {
          ['<Tab>'] = 'toggle_preview',
          ['<C-z>'] = 'cycle_win',
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
-- vim.keymap.set('n', '<leader><Tab>', function()
--   picker.smart({ filter = { cwd = vim.fn.getcwd() } })
-- end, { desc = 'Files (Smart) (cwd)' })

-- files
vim.keymap.set('n', '<leader>ff', picker.files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  picker.files({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Files (Relative)' })
vim.keymap.set('n', '<leader>fr', picker.recent, { desc = 'Files (Recent)' })
vim.keymap.set('n', '<leader>fR', function()
  picker.recent({ filter = { cwd = vim.fn.getcwd() } })
end, { desc = 'Files (Recent) (cwd)' })
vim.keymap.set('n', '<leader>fb', picker.buffers)

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
vim.keymap.set('n', 'gd', picker.lsp_definitions, { desc = 'LSP: Goto Definition' })
vim.keymap.set('n', 'gr', picker.lsp_references, { desc = 'LSP: Goto References' })
vim.keymap.set('n', '<leader>fd', picker.diagnostics, { desc = 'LSP: Diagnostics' })

-- misc
vim.keymap.set('n', ',', function()
  picker.lines()
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

-- git
vim.keymap.set('n', '<leader>gl', picker.git_log_file, { desc = 'Log' })
vim.keymap.set('x', '<leader>gl', picker.git_log_line, { desc = 'Log' })

-- vim
vim.keymap.set('n', '<leader>fh', picker.help, { desc = 'Help' })
vim.keymap.set('n', '<leader>fl', picker.highlights, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>ft', picker.colorschemes, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>fc', picker.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fC', picker.pickers, { desc = 'Pickers' })
vim.keymap.set('n', '<leader>fa', picker.autocmds, { desc = 'Autocommands' })
vim.keymap.set('n', '<leader>fk', picker.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>"', picker.registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>:', picker.command_history, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', picker.search_history, { desc = 'Search History' })
