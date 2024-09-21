local telescope = require('telescope')
local actions = require('telescope.actions')
local layout = require('telescope.actions.layout')

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    layout_strategy = 'vertical',
    layout_config = {
      -- center = {
      --   height = 0.2,
      --   -- preview_cutoff = 360,
      --   prompt_position = 'top',
      --   width = 0.9,
      -- },
    },

    prompt_prefix = ' ',
    selection_caret = '▍ ',
    -- entry_prefix = '  ',
    multi_icon = ' ',

    results_title = false,
    -- path_display = { 'smart' },
    -- path_display = {},
    -- path_display = { 'filename_first' },
    preview = {
      hide_on_startup = true,
    },

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
        ['<C-h>'] = actions.results_scrolling_left,
        ['<C-l>'] = actions.results_scrolling_right,

        -- history
        ['<Down>'] = actions.cycle_history_next,
        ['<Up>'] = actions.cycle_history_prev,

        -- preview
        ['<Tab>'] = layout.toggle_preview,
      },
    },
  },
  pickers = {
    -- find_files = {
    --   hidden = true,
    -- },
  },
})

-- extensions
telescope.load_extension('ui-select')
telescope.load_extension('zf-native')

local builtin = require('telescope.builtin')

-- files
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Oldfiles' })

-- grep
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Grep (Live)' })
-- vim.keymap.set('n', '<leader>fg', builtin.grep_string, { desc = 'Grep' })
vim.keymap.set('n', ',', function()
  builtin.current_buffer_fuzzy_find({
    skip_empty_lines = true,
    results_ts_highlight = false,
  })
end)

-- misc
vim.keymap.set('n', "'", builtin.resume)

-- vim
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
vim.keymap.set('n', '<leader>fC', builtin.builtin, { desc = 'Commands (Telescope)' })
vim.keymap.set('n', '<leader>f:', builtin.command_history, { desc = 'Command History' })
vim.keymap.set('n', '?', builtin.search_history)
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

-- git
-- vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Commits' })
-- vim.keymap.set('n', '<leader>gC', builtin.git_bcommits, { desc = 'Commits (Buffer)' })

-- lsp
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fD', function()
  builtin.diagnostics({ bufnr = 0 })
end, { desc = 'Diagnostics (Buffer)' })
