local snacks = require('snacks')

snacks.setup({
  -- bigfile
  bigfile = {
    size = 1.0 * 1024 * 1024, -- 1.0MB
  },

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

  -- indent
  indent = {
    animate = { enabled = false },
    scope = { enabled = false },
  },
  -- scope
  scope = {},

  -- pickers
  picker = {
    prompt = '',
    -- prompt = '> ',
    sources = {
      smart = {
        matcher = { sort_empty = false },
        hidden = vim.env.SSH_CLIENT == nil,

        -- testing
        -- follow = true

        -- needed for ~/.local/share/nvim files to show
        filter = false,
      },
      grep = { hidden = vim.env.SSH_CLIENT == nil },
    },
    layout = {
      cycle = false,
      preset = 'default',
    },
    layouts = {
      default = { -- modified vertical
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
      select = {
        layout = {
          border = 'single',
        },
      },
    },
    formatters = {
      file = {
        -- filename_first = true,
        truncate = 120,
      },
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
          ['<C-S-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
          ['<C-S-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          ['<C-S-h>'] = { 'preview_scroll_left', mode = { 'i', 'n' } },
          ['<C-S-l>'] = { 'preview_scroll_right', mode = { 'i', 'n' } },
          ['<C-space>'] = { 'cycle_win', mode = { 'i', 'n' } },
          ['<Up>'] = { 'history_back', mode = { 'i', 'n' } },
          ['<Down>'] = { 'history_forward', mode = { 'i', 'n' } },
          ['<C-h>'] = false,
          ['<C-l>'] = false,
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
  snacks.git.blame_line({ win = { border = 'single' } })
end, { desc = 'Blame' })

-- picker
local picker = snacks.picker

-- files
vim.keymap.set('n', '<Tab>', picker.smart, { desc = 'Files (Smart)' })
vim.keymap.set('n', '<leader><Tab>', function()
  picker.smart({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Files (Smart) (Relative)' })
vim.keymap.set('n', '<leader>fb', picker.buffers, { desc = 'Buffers' })

-- grep
vim.keymap.set('n', '<leader>fw', picker.grep, { desc = 'Grep Live' })
vim.keymap.set('n', '<leader>fW', function()
  picker.grep({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Grep Live (Relative)' })
vim.keymap.set('n', '<leader>*', picker.grep_word, { desc = 'Grep cword' })
vim.keymap.set('n', '<leader>#', function()
  picker.grep_word({ cwd = vim.fn.expand('%:p:h') })
end, { desc = 'Grep cword (Relative)' })
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
vim.keymap.set('n', '<leader>fd', function()
  picker.diagnostics_buffer({ layout = { preview = true } })
end, { desc = 'LSP: Diagnostics (Buffer)' })
vim.keymap.set('n', '<leader>fD', function()
  picker.diagnostics({ layout = { preview = true } })
end, { desc = 'LSP: Diagnostics' })

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
vim.keymap.set('n', '<leader>fi', function()
  picker.icons({
    layout = { preset = 'default' },
    confirm = 'yank',
  })
end, { desc = 'Icons' })
vim.keymap.set('n', '<leader>fz', picker.zoxide, { desc = 'Zoxide' })

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
vim.keymap.set('n', '<leader>fk', function()
  picker.keymaps({ layout = { preview = true } })
end, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fn', picker.notifications, { desc = 'Notifications' })
vim.keymap.set('n', '<leader>"', function()
  picker.registers({ layout = { preview = true } })
end, { desc = 'Registers' })
vim.keymap.set('n', '<leader>:', function()
  picker.command_history({ layout = { preset = 'default' } })
end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', function()
  picker.search_history({ layout = { preset = 'default' } })
end, { desc = 'Search History' })
