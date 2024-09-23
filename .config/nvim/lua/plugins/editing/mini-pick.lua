local pick = require('mini.pick')
local extra = require('mini.extra')
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
  -- centered
  window = {
    config = function()
      local popup = require('utils').popup
      return {
        anchor = 'NW',
        height = popup.height,
        width = popup.width,
        row = math.floor(0.5 * (vim.o.lines - popup.height)),
        col = math.floor(0.5 * (vim.o.columns - popup.width)),
      }
    end,
    prompt_prefix = ' ',
  },
})

-- helpers
local function cwd_opts(name, opts)
  return vim.tbl_deep_extend('force', {
    source = {
      name = name .. ' (' .. vim.fn.getcwd() .. ')',
    },
  }, opts or {})
end
local function relative_opts(name, opts)
  local relative_path = vim.fn.expand('%:p:h')
  return vim.tbl_deep_extend('force', {
    source = {
      name = name .. ' (' .. relative_path .. ')',
      cwd = relative_path,
    },
  }, opts or {})
end

-- files
vim.keymap.set('n', '<leader>ff', function()
  pick.builtin.files({ tool = 'fd' }, cwd_opts('Files'))
end, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  pick.builtin.files({ tool = 'fd' }, relative_opts('Files'))
end, { desc = 'Files (Relative)' })
vim.keymap.set({ tool = 'fd' }, '<leader>fr', extra.pickers.oldfiles, { desc = 'Files (Recent)' })

-- grep live
vim.keymap.set('n', '<leader>fw', function()
  pick.builtin.grep_live(nil, cwd_opts('Grep Live'))
end, { desc = 'Grep Live' })
vim.keymap.set('n', '<leader>fW', function()
  pick.builtin.grep_live(nil, relative_opts('Grep Live'))
end, { desc = 'Grep Live (Relative)' })

-- grep
vim.keymap.set('n', '<leader>fg', function()
  local input = vim.fn.input('Grep (cwd): ')
  if input ~= '' then
    local opts = cwd_opts('Grep')
    opts.source.name = opts.source.name .. ': ' .. input
    pick.builtin.grep({ pattern = input }, opts)
  end
end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>fG', function()
  local input = vim.fn.input('Grep (Relative): ')
  if input ~= '' then
    local opts = relative_opts('Grep')
    opts.source.name = opts.source.name .. ': ' .. input
    pick.builtin.grep({ pattern = input }, opts)
  end
end, { desc = 'Grep (Relative)' })

-- grep (visual)
-- vim.keymap.set('x', '<leader>fg function()
--   local cword = vim.fn.expand('<cword>')
--   local opts = cwd_opts('Grep cword')
--   opts.source.name = opts.source.name .. ': ' .. cword
--   pick.builtin.grep({ pattern = cword }, opts)
-- end, { desc = 'Grep' })
-- vim.keymap.set('x', '<leader>fG', function()
--   local cword = vim.fn.expand('<cword>')
--   local opts = relative_opts('Grep cword')
--   opts.source.name = opts.source.name .. ': ' .. cword
--   pick.builtin.grep({ pattern = cword }, opts)
-- end, { desc = 'Grep (Relative)' })

-- grep (buffer)
vim.keymap.set('n', ',', function()
  extra.pickers.buf_lines({ scope = 'current' }, {
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

-- git
-- files
-- vim.keymap.set('n', '<leader>gf', function()
--   extra.pickers.git_files({ scope = 'tracked' })
-- end, { desc = 'Files (Tracked)' })
-- vim.keymap.set('n', '<leader>gF', function()
--   extra.pickers.git_files({ scope = 'untracked' })
-- end, { desc = 'Files (Untracked)' })
-- vim.keymap.set('n', '<leader>gm', function()
--   extra.pickers.git_files({ scope = 'modified' })
-- end, { desc = 'Files (Modified)' })
-- vim.keymap.set('n', '<leader>gi', function()
--   extra.pickers.git_files({ scope = 'ignored' })
-- end, { desc = 'Files (Ignored)' })

-- hunks
vim.keymap.set('n', '<leader>gh', extra.pickers.git_hunks, { desc = 'Hunks' })
vim.keymap.set('n', '<leader>gH', function()
  extra.pickers.git_hunks({ path = vim.fn.expand('%:p') })
end, { desc = 'Hunks (Buffer)' })

-- commits
vim.keymap.set('n', '<leader>gc', extra.pickers.git_commits, { desc = 'Commits' })
vim.keymap.set('n', '<leader>gC', function()
  extra.pickers.git_commits({ path = vim.fn.expand('%:p') })
end, { desc = 'Commits (Buffer)' })

-- misc
vim.keymap.set('n', "'", function()
  if not pcall(pick.builtin.resume) then
    vim.notify('[mini.pick] No picker to resume', vim.log.levels.WARN)
  end
end)

-- vim
vim.keymap.set('n', '<leader>fh', pick.builtin.help, { desc = 'Help' })
vim.keymap.set('n', '<leader>fl', extra.pickers.hl_groups, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>fk', extra.pickers.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fK', function()
  extra.pickers.keymaps({ scope = 'buf' })
end, { desc = 'Keymaps (Buffer)' })
vim.keymap.set('n', '<leader>fo', extra.pickers.options, { desc = 'Options' })
-- vim.keymap.set('n', '<leader>fob', function()
--   extra.pickers.options({ scope = 'buf' })
-- end, { desc = 'Options (Buffer)' })
-- vim.keymap.set('n', '<leader>fow', function()
--   extra.pickers.options({ scope = 'win' })
-- end, { desc = 'Options (Window)' })
-- vim.keymap.set('n', '<leader>fog', function()
--   extra.pickers.options({ scope = 'global' })
-- end, { desc = 'Options (Global)' })
vim.keymap.set('n', '<leader>"', extra.pickers.registers, { desc = 'Registers' })
-- vim.keymap.set('n', '<leader>:', pick.history, { desc = 'Command History' })
-- vim.keymap.set('n', '<leader>/', pick.history, { desc = 'Search History' })
vim.keymap.set('n', '<leader>fc', extra.pickers.commands, { desc = 'Commands' })
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
