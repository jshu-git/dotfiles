local telescope = require('telescope')
local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
local utils = require('telescope.utils')
local builtin = require('telescope.builtin')
local state = require('telescope.state')
local action_state = require('telescope.actions.state')

-- preview helper https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/set.lua#L237
local is_previewing = function(prompt_bufnr)
  local previewer = action_state.get_current_picker(prompt_bufnr).previewer
  local status = state.get_status(prompt_bufnr)
  local preview_winid = status.layout.preview and status.layout.preview.winid
  -- Check if we actually have a previewer and a preview window
  return type(previewer) ~= 'table' or not preview_winid
end

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',

    -- layout
    layout_strategy = 'horizontal',
    layout_config = {
      anchor = 'N',
      anchor_padding = 2,
      height = 0.9,
      prompt_position = 'top',
      scroll_speed = 4,
      width = 0.9,
      preview_cutoff = 1,
      horizontal = { preview_width = 0.66 },
    },
    borderchars = require('utils').border,

    -- icons
    prompt_prefix = '',
    selection_caret = '',
    entry_prefix = '',
    multi_icon = '',

    -- preview
    dynamic_preview_title = true,
    results_title = false,
    preview = {
      filesize_limit = 2,
      hide_on_startup = true,
    },

    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L133
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-s>'] = actions.select_horizontal,
        ['<C-g>'] = actions.to_fuzzy_refine,

        -- preview
        ['<Tab>'] = layout.toggle_preview,
        ['<S-Tab>'] = actions.cycle_previewers_next,

        -- history
        ['<Down>'] = actions.cycle_history_next,
        ['<Up>'] = actions.cycle_history_prev,

        -- marking
        ['<C-a>'] = actions.toggle_all,
        ['<C-x>'] = actions.toggle_selection + actions.move_selection_worse,
        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,

        -- smart scroll
        ['<C-u>'] = function(prompt_bufnr)
          return is_previewing(prompt_bufnr) and actions.results_scrolling_up(prompt_bufnr)
            or actions.preview_scrolling_up(prompt_bufnr)
        end,
        ['<C-d>'] = function(prompt_bufnr)
          return is_previewing(prompt_bufnr) and actions.results_scrolling_down(prompt_bufnr)
            or actions.preview_scrolling_down(prompt_bufnr)
        end,
        ['<C-h>'] = function(prompt_bufnr)
          return is_previewing(prompt_bufnr) and actions.results_scrolling_left(prompt_bufnr)
            or actions.preview_scrolling_left(prompt_bufnr)
        end,
        ['<C-l>'] = function(prompt_bufnr)
          return is_previewing(prompt_bufnr) and actions.results_scrolling_right(prompt_bufnr)
            or actions.preview_scrolling_right(prompt_bufnr)
        end,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--color', 'never' },
      follow = true,
      hidden = true,
    },
    live_grep = { disable_coordinates = true },
    command_history = {
      mappings = { i = { ['<CR>'] = actions.edit_command_line } },
      sorting_strategy = 'descending',
      layout_config = { prompt_position = 'bottom' },
    },
    search_history = {
      mappings = { i = { ['<CR>'] = actions.edit_search_line } },
      sorting_strategy = 'descending',
      layout_config = { prompt_position = 'bottom' },
    },
    current_buffer_fuzzy_find = {
      mappings = {
        i = {
          ['<CR>'] = function(prompt_bufnr)
            local prompt = action_state.get_current_line()
            if prompt ~= '' then
              vim.fn.setreg('/', prompt)
            end
            return actions.select_default(prompt_bufnr)
          end,
        },
      },
    },
    colorscheme = {
      mappings = {
        i = {
          ['<Tab>'] = function()
            vim.cmd.colorscheme(action_state.get_selected_entry().value)
          end,
        },
      },
    },
  },
})
telescope.load_extension('ui-select')
telescope.load_extension('zf-native')

-- files
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  builtin.find_files({ prompt_title = 'Find Files (Relative)', cwd = utils.buffer_dir() })
end, { desc = 'Files (Relative)' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Files (Recent)' })
vim.keymap.set('n', '<leader>fn', function()
  builtin.find_files({ cwd = vim.fn.stdpath('config') })
end, { desc = 'Files (nvim)' })

-- grep
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fW', function()
  builtin.live_grep({ prompt_title = 'Live Grep (Relative)', cwd = utils.buffer_dir() })
end, { desc = 'Grep Live (Relative)' })
vim.keymap.set('x', '<leader>fw', function()
  builtin.live_grep({
    default_text = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), '\n'),
  })
end, { desc = 'Live Grep' })
vim.keymap.set('x', '<leader>fW', function()
  builtin.grep_string({
    default_text = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), '\n'),
    cwd = utils.buffer_dir(),
  })
end, { desc = 'Live Grep (Relative)' })

-- lsp
vim.keymap.set('n', 'gd', function()
  builtin.lsp_definitions({
    preview = { hide_on_startup = false },
    jump_type = 'never',
    show_line = false,
    trim_text = true,
  })
end, { desc = 'LSP: Definition' })
vim.keymap.set('n', 'gr', function()
  builtin.lsp_references({
    preview = { hide_on_startup = false },
    -- include_declaration = false,
    jump_type = 'never',
    show_line = false,
    trim_text = true,
  })
end, { desc = 'LSP: References' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'LSP: Diagnostics' })
vim.keymap.set('n', '<leader>fD', function()
  builtin.diagnostics({ bufnr = 0 })
end, { desc = 'LSP: Diagnostics (Buffer)' })

-- git
vim.keymap.set('n', '<leader>gc', function()
  builtin.git_commits({ preview = { hide_on_startup = false } })
end, { desc = 'Commits' })
vim.keymap.set('n', '<leader>gC', function()
  builtin.git_bcommits({ preview = { hide_on_startup = false } })
end, { desc = 'Commits (Buffer)' })

-- misc
vim.keymap.set('n', ',', function()
  builtin.current_buffer_fuzzy_find({
    skip_empty_lines = true,
    results_ts_highlight = false,
  })
end)
vim.keymap.set('n', "'", builtin.resume)
vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', builtin.search_history, { desc = 'Search History' })
vim.keymap.set('n', '<leader>"', builtin.registers, { desc = 'Registers' })

-- vim
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fC', builtin.builtin, { desc = 'Commands (Telescope)' })
vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Options' })
vim.keymap.set('n', '<leader>fh', function()
  builtin.help_tags({ preview = { hide_on_startup = false } })
end, { desc = 'Help' })
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fK', function()
  builtin.keymaps({ only_buf = true })
end, { desc = 'Keymaps (Buffer)' })
vim.keymap.set('n', '<leader>fl', function()
  builtin.highlights({ preview = { hide_on_startup = false } })
end, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>fa', builtin.autocommands, { desc = 'Autocommands' })
