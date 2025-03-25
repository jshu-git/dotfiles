local snacks = require('snacks')
snacks.picker.util.truncpath = function(path, _, opts)
  local cwd = svim.fs.normalize(opts and opts.cwd or vim.fn.getcwd(), { _fast = true, expand_env = false })
  path = svim.fs.normalize(path, { _fast = true, expand_env = false })
  if path:find(cwd .. '/', 1, true) == 1 and #path > #cwd then
    return path:sub(#cwd + 2)
  else
    local home = svim.fs.normalize('~')
    return '~' .. path:sub(#home + 1)
  end
end

snacks.setup({
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
    sources = {
      smart = {
        matcher = { sort_empty = false },
        hidden = vim.env.SSH_CLIENT == nil,
        -- follow = true

        -- filter=false needed for ~/.local/share/nvim files to show
        -- for work, mounts cause slowness
        filter = vim.env.SSH_CLIENT and { cwd = vim.env.HOME } or false,
      },
      grep = { hidden = vim.env.SSH_CLIENT == nil },
    },
    layout = {
      cycle = false,
      preset = 'default',
    },
    layouts = {
      default = { -- modified vertical
        hidden = { 'preview' },
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
    previewers = {
      diff = { builtin = false },
      git = { builtin = false },
    },
    win = {
      input = {
        keys = {
          ['<Esc>'] = { 'close', mode = { 'i', 'n' } },
          ['<Tab>'] = { 'toggle_preview', mode = { 'i', 'n' } },
          ['<C-x>'] = { 'select_and_next', mode = { 'i', 'n' } },
          ['<Up>'] = { 'history_back', mode = { 'i', 'n' } },
          ['<Down>'] = { 'history_forward', mode = { 'i', 'n' } },

          -- focus
          ['<C-j>'] = { 'focus_list', mode = { 'i', 'n' } },
          ['<C-k>'] = { 'focus_preview', mode = { 'i', 'n' } },

          -- scrolling
          ['<C-u>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
          ['<C-d>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
          ['<C-h>'] = { 'preview_scroll_left', mode = { 'i', 'n' } },
          ['<C-l>'] = { 'preview_scroll_right', mode = { 'i', 'n' } },

          ['<C-a>'] = false,
        },
      },
      list = {
        keys = {
          ['<Tab>'] = 'toggle_preview',
          ['<C-j>'] = 'focus_preview',
          ['<C-k>'] = 'focus_input',
        },
      },
      preview = {
        keys = {
          ['<Tab>'] = 'toggle_preview',
          ['<C-j>'] = 'focus_input',
          ['<C-k>'] = 'focus_list',
        },
      },
    },
    actions = {
      focus_preview = function(picker)
        if picker.preview.win:valid() then
          picker:focus('preview', { show = true })
        end
      end,
      preview_scroll_down = function(picker)
        if picker.preview.win:valid() then
          picker.preview.win:scroll()
        else
          picker.list:scroll(picker.list.state.scroll)
        end
      end,
      preview_scroll_up = function(picker)
        if picker.preview.win:valid() then
          picker.preview.win:scroll(true)
        else
          picker.list:scroll(-picker.list.state.scroll)
        end
      end,
      preview_scroll_left = function(picker)
        if picker.preview.win:valid() then
          picker.preview.win:hscroll(true)
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Left>', true, false, true), 'n', false)
        end
      end,
      preview_scroll_right = function(picker)
        if picker.preview.win:valid() then
          picker.preview.win:hscroll()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Right>', true, false, true), 'n', false)
        end
      end,
    },
  },
})

-- git
vim.keymap.set({ 'n', 'x' }, '<leader>gy', function()
  snacks.gitbrowse({
    open = function(url)
      vim.fn.setreg(vim.v.register, url)
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
  })
end, { desc = 'Git: Yank URL' })
vim.keymap.set({ 'n', 'x' }, '<leader>gb', function()
  snacks.git.blame_line({
    win = {
      width = 0.8,
      height = 0.8,
      border = 'single',
      backdrop = false,
      -- keys = { ['<Esc>'] = 'close' },
    },
  })
end, { desc = 'Git: Blame' })

-- zen
vim.keymap.set('n', '<leader>z', function()
  snacks.zen.zen({
    toggles = {
      dim = false,
    },
    win = {
      width = 0.8,
      height = 0.8,
      border = 'single',
      backdrop = false,
      -- keys = { ['<Esc>'] = 'close' },
    },
  })
end, { desc = 'Zen' })

-- picker
local picker = snacks.picker

-- files
vim.keymap.set('n', '<Tab>', picker.smart, { desc = 'Files (Smart)' })
-- vim.keymap.set('n', '<leader><Tab>', function()
--   picker.smart({ cwd = vim.fn.expand('%:p:h') })
-- end, { desc = 'Files (Smart) (Relative)' })
-- vim.keymap.set('n', '<leader>fb', picker.buffers, { desc = 'Buffers' })

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
  picker.lsp_definitions({
    auto_confirm = false,
    layout = { hidden = {} },
  })
end, { desc = 'LSP: Goto Definition' })
vim.keymap.set('n', 'gr', function()
  picker.lsp_references({
    auto_confirm = false,
    layout = { hidden = {} },
  })
end, { desc = 'LSP: Goto References' })
vim.keymap.set('n', '<leader>fd', picker.diagnostics_buffer, { desc = 'LSP: Diagnostics (Buffer)' })
vim.keymap.set('n', '<leader>fD', picker.diagnostics, { desc = 'LSP: Diagnostics' })

-- misc
vim.keymap.set('n', ',', function()
  picker.lines({
    layout = {
      preview = false,
      preset = 'select',
    },
    -- confirm = function(picker, _)
    --   local pattern = picker.finder.filter.pattern
    --   if pattern ~= '' then
    --     vim.fn.setreg('/', pattern)
    --   end
    --   picker:close()
    -- end,
  })
end)
vim.keymap.set('n', "'", picker.resume)
vim.keymap.set('n', '<leader>u', function()
  picker.undo({ layout = { hidden = {} } })
end, { desc = 'Undo Tree' })
vim.keymap.set('n', '<leader>fi', function()
  picker.icons({
    layout = { preset = 'default' },
    confirm = { action = { 'yank', 'close' } },
  })
end, { desc = 'Icons' })

-- git
vim.keymap.set({ 'n', 'x' }, '<leader>gl', function()
  picker.git_log_line({ layout = { hidden = {} } })
end, { desc = 'Git: Log (Line)' })
vim.keymap.set('n', '<leader>gL', function()
  picker.git_log_file({ layout = { hidden = {} } })
end, { desc = 'Git: Log (File)' })
vim.keymap.set('n', '<leader>gh', function()
  picker.git_diff({ layout = { hidden = {} } })
end, { desc = 'Git: Hunks' })

-- vim
vim.keymap.set('n', '<leader>fh', function()
  picker.help({ layout = { hidden = {} } })
end, { desc = 'Help' })
vim.keymap.set('n', '<leader>fl', function()
  picker.highlights({
    layout = { hidden = {} },
    confirm = { action = { 'yank', 'close' } },
  })
end, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>ft', picker.colorschemes, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>fc', picker.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fC', picker.pickers, { desc = 'Pickers' })
vim.keymap.set('n', '<leader>fa', picker.autocmds, { desc = 'Autocommands' })
vim.keymap.set('n', '<leader>fk', picker.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>"', picker.registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>:', function()
  picker.command_history({ layout = { preset = 'default' } })
end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', function()
  picker.search_history({ layout = { preset = 'default' } })
end, { desc = 'Search History' })
