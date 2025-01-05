local pick = require('mini.pick')
local extras = require('mini.extra').pickers
vim.ui.select = pick.ui_select

pick.setup({
  mappings = {
    delete_left = '', -- defaults to <C-u>
    move_start = '', -- defaults to <C-g>

    choose_marked = '<C-q>',
    refine = '<C-g>',
    refine_marked = '<C-S-g>',
    scroll_down = '<C-d>',
    scroll_up = '<C-u>',
  },
  window = {
    config = { row = vim.o.lines - 1 },
    -- centered
    -- config = function()
    --   local popup = require('utils').popup
    --   return {
    --     anchor = 'NW',
    --     height = popup.height,
    --     width = popup.width,
    --     row = math.floor(0.5 * (vim.o.lines - popup.height)),
    --     col = math.floor(0.5 * (vim.o.columns - popup.width)),
    --   }
    -- end,
    prompt_cursor = '│',
    prompt_prefix = ' ',
  },
})

-- helpers
local function path_opts(name, use_relative, opts)
  local path = use_relative and vim.fn.expand('%:p:h') or vim.fn.getcwd()
  return vim.tbl_deep_extend('force', {
    source = {
      name = name .. ' (' .. path .. ')',
      cwd = use_relative and path or nil,
    },
  }, opts or {})
end

-- files
vim.keymap.set('n', '<leader>ff', function()
  pick.builtin.files({ tool = 'fd' }, path_opts('Files'))
end, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  pick.builtin.files({ tool = 'fd' }, path_opts('Files', true))
end, { desc = 'Files (Relative)' })
vim.keymap.set('n', '<leader>fr', function()
  extras.oldfiles({ tool = 'fd' })
end, { desc = 'Files (Recent)' })

-- grep (live)
vim.keymap.set('n', '<leader>fw', function()
  pick.builtin.grep_live(nil, path_opts('Grep Live'))
end, { desc = 'Grep Live' })
vim.keymap.set('n', '<leader>fW', function()
  pick.builtin.grep_live(nil, path_opts('Grep Live', true))
end, { desc = 'Grep Live (Relative)' })

-- grep
vim.keymap.set('n', '<leader>fg', function()
  local input = vim.fn.input('Grep (cwd): ', vim.fn.expand('<cword>'))
  if input ~= '' then
    local opts = path_opts('Grep')
    opts.source.name = opts.source.name .. ': ' .. input
    pick.builtin.grep({ pattern = input }, opts)
  end
end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>fG', function()
  local input = vim.fn.input('Grep (Relative): ', vim.fn.expand('<cword>'))
  if input ~= '' then
    local opts = path_opts('Grep', true)
    opts.source.name = opts.source.name .. ': ' .. input
    pick.builtin.grep({ pattern = input }, opts)
  end
end, { desc = 'Grep (Relative)' })

-- grep (visual)
vim.keymap.set('x', '<leader>fg', function()
  local opts = path_opts('Grep')
  local selection = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), '\n')
  opts.source.name = opts.source.name .. ': ' .. selection
  pick.builtin.grep({ pattern = selection }, opts)
end, { desc = 'Grep' })
vim.keymap.set('x', '<leader>fG', function()
  local opts = path_opts('Grep (Relative)', true)
  local selection = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), '\n')
  opts.source.name = opts.source.name .. ': ' .. selection
  pick.builtin.grep({ pattern = selection }, opts)
end, { desc = 'Grep (Relative)' })

-- lsp
vim.keymap.set('n', 'gd', function()
  extras.lsp({ scope = 'definition' })
end, { desc = 'LSP: Goto Definition' })
vim.keymap.set('n', 'gr', function()
  extras.lsp({ scope = 'references' })
end, { desc = 'LSP: Goto References' })
-- vim.keymap.set('n', '<leader>fd', function()
--   extra.diagnostic({ scope = 'all' })
-- end, { desc = 'LSP: Diagnostics' })
-- vim.keymap.set('n', '<leader>fD', function()
--   extra.diagnostic({ scope = 'current' })
-- end, { desc = 'LSP: Diagnostics (Buffer)' })

-- misc
vim.keymap.set('n', ',', function()
  extras.buf_lines({ scope = 'current' }, {
    source = {
      choose = function(item)
        ---@diagnostic disable:param-type-mismatch
        local query = table.concat(pick.get_picker_query())
        if query ~= '' then
          vim.fn.setreg('/', query)
        end
        pick.default_choose(item)
      end,
    },
  })
end)
vim.keymap.set('n', "'", function()
  if not pcall(pick.builtin.resume) then
    vim.notify('[mini.pick] No picker to resume', vim.log.levels.WARN)
  end
end)

-- git
-- files
-- vim.keymap.set('n', '<leader>gf', function()
--   extra.git_files({ scope = 'tracked' })
-- end, { desc = 'Files (Tracked)' })
-- vim.keymap.set('n', '<leader>gF', function()
--   extra.git_files({ scope = 'untracked' })
-- end, { desc = 'Files (Untracked)' })
-- vim.keymap.set('n', '<leader>gm', function()
--   extra.git_files({ scope = 'modified' })
-- end, { desc = 'Files (Modified)' })
-- vim.keymap.set('n', '<leader>gi', function()
--   extra.git_files({ scope = 'ignored' })
-- end, { desc = 'Files (Ignored)' })
-- vim.keymap.set('n', '<leader>gh', extra.git_hunks, { desc = 'Hunks' })
-- vim.keymap.set('n', '<leader>gH', function()
--   extra.git_hunks({ path = vim.fn.expand('%:p') })
-- end, { desc = 'Hunks (Buffer)' })

-- commits
vim.keymap.set('n', '<leader>gc', extras.git_commits, { desc = 'Commits' })
vim.keymap.set('n', '<leader>gC', function()
  extras.git_commits({ path = vim.fn.expand('%:p') })
end, { desc = 'Commits (Buffer)' })

-- vim
vim.keymap.set('n', '<leader>fh', pick.builtin.help, { desc = 'Help' })
vim.keymap.set('n', '<leader>fl', extras.hl_groups, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>fo', extras.options, { desc = 'Options' })
vim.keymap.set('n', '<leader>ft', function()
  return pick.start({
    source = {
      name = 'Colorschemes',
      items = vim.fn.getcompletion('', 'color'),
      choose = function(item)
        vim.cmd('colorscheme ' .. item)
      end,
      ---@diagnostic disable-next-line: unused-local
      preview = function(buf_id, item)
        vim.cmd('colorscheme ' .. item)
      end,
    },
  })
end, { desc = 'Themes' })

-- vim misc
vim.keymap.set('n', '<leader>fc', extras.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fk', extras.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fK', function()
  extras.keymaps({ scope = 'buf' })
end, { desc = 'Keymaps (Buffer)' })
vim.keymap.set('n', '<leader>"', extras.registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>:', function()
  extras.history({ scope = ':' })
end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', function()
  extras.history({ scope = '/' })
end, { desc = 'Search History' })
