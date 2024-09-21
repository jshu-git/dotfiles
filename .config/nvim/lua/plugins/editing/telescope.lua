local telescope = require('telescope')
local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')
local utils = require('telescope.utils')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',

    -- layout
    layout_strategy = 'center',
    layout_config = {
      anchor = 'S',
      anchor_padding = 4,
      height = 0.5,
      width = 0.8,
      prompt_position = 'top',
      preview_cutoff = 1,
    },
    borderchars = {
      prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
      results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },

    -- icons
    prompt_prefix = '',
    selection_caret = '',
    entry_prefix = '',
    multi_icon = '',

    dynamic_preview_title = true,
    results_title = false,
    -- path_display = { 'smart' },
    -- path_display = {},
    -- path_display = { 'filename_first' },
    preview = { hide_on_startup = true },

    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L133
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-s>'] = actions.select_horizontal,
        ['<C-g>'] = actions.to_fuzzy_refine,

        -- marking
        ['<C-a>'] = actions.toggle_all,
        ['<C-x>'] = actions.toggle_selection,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.send_to_qflist + actions.open_qflist,

        -- scrolling
        ['<C-u>'] = actions.results_scrolling_up,
        ['<C-d>'] = actions.results_scrolling_down,
        ['<C-h>'] = actions.results_scrolling_left,
        ['<C-l>'] = actions.results_scrolling_right,

        -- history
        ['<Down>'] = actions.cycle_history_next,
        ['<Up>'] = actions.cycle_history_prev,

        -- preview
        ['<Tab>'] = layout.toggle_preview,
        ['<C-y>'] = actions.preview_scrolling_up,
        ['<C-e>'] = actions.preview_scrolling_down,
        -- ['<C-h>'] = actions.preview_scrolling_left,
        -- ['<C-l>'] = actions.preview_scrolling_right,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { 'fd', '--type', 'f', '--color', 'never' },
    },
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
  },
})
telescope.load_extension('ui-select')
telescope.load_extension('zf-native')

-- files
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fF', function()
  builtin.find_files({ cwd = utils.buffer_dir() })
end, { desc = 'Files (Relative)' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Oldfiles' })

-- grep
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Grep Live' })
vim.keymap.set('n', '<leader>fW', function()
  builtin.live_grep({ cwd = utils.buffer_dir() })
end, { desc = 'Grep Live (Relative)' })

-- lsp
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'LSP: Diagnostics' })
vim.keymap.set('n', '<leader>fD', function()
  builtin.diagnostics({ bufnr = 0 })
end, { desc = 'LSP: Diagnostics (Buffer)' })
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
    include_declaration = false,
    jump_type = 'never',
    show_line = false,
    trim_text = true,
  })
end, { desc = 'LSP: References' })

-- misc
vim.keymap.set('n', ',', function()
  builtin.current_buffer_fuzzy_find({
    skip_empty_lines = true,
    results_ts_highlight = false,
  })
end)
vim.keymap.set('n', "'", builtin.resume)

-- vim
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fC', builtin.builtin, { desc = 'Commands (Telescope)' })
vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Command History' })
vim.keymap.set('n', '<leader>/', builtin.search_history, { desc = 'Search History' })
vim.keymap.set('n', '<leader>fo', builtin.vim_options, { desc = 'Options' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })
vim.keymap.set('n', '<leader>ft', builtin.colorscheme, { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>"', builtin.registers, { desc = 'Registers' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fK', function()
  builtin.keymaps({ only_buf = true })
end, { desc = 'Keymaps (Buffer)' })
vim.keymap.set('n', '<leader>fl', builtin.highlights, { desc = 'Highlights' })
vim.keymap.set('n', '<leader>fa', builtin.autocommands, { desc = 'Autocommands' })
