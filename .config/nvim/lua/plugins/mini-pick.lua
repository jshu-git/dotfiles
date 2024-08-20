return {
  'echasnovski/mini.pick',
  config = function()
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
      options = {
        use_cache = true,
      },
      -- centered
      window = {
        config = function()
          local popup = require('config.utils').popup
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
          cwd = relative_path,
          name = name .. ' (' .. relative_path .. ')',
        },
      }, opts or {})
    end

    -- files
    vim.keymap.set('n', '<leader>ff', function()
      pick.builtin.files(nil, cwd_opts('Files'))
    end, { desc = 'Files' })
    vim.keymap.set('n', '<leader>fF', function()
      pick.builtin.files(nil, relative_opts('Files'))
    end, { desc = 'Files (Relative)' })
    vim.keymap.set(
      'n',
      '<leader>fr',
      extra.pickers.oldfiles,
      { desc = 'Recent Files (All)' }
    )
    vim.keymap.set('n', '<leader>fR', function()
      extra.pickers.oldfiles({ current_dir = true })
    end, { desc = 'Recent Files (cwd)' })

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

    -- grep cword
    vim.keymap.set('n', '<leader>*', function()
      local cword = vim.fn.expand('<cword>')
      local opts = cwd_opts('Grep cword')
      opts.source.name = opts.source.name .. ': ' .. cword
      pick.builtin.grep({ pattern = cword }, opts)
    end, { desc = 'Grep cword' })
    vim.keymap.set('n', '<leader>#', function()
      local cword = vim.fn.expand('<cword>')
      local opts = relative_opts('Grep cword')
      opts.source.name = opts.source.name .. ': ' .. cword
      pick.builtin.grep({ pattern = cword }, opts)
    end, { desc = 'Grep cword (Relative)' })

    -- grep buffer
    vim.keymap.set('n', ',', function()
      extra.pickers.buf_lines({
        scope = 'current',
        preserve_order = true,
      }, {
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

    -- buffers
    vim.keymap.set('n', '<leader><Tab>', function()
      pick.builtin.buffers(nil, {
        mappings = {
          scroll_down = '',
          wipeout = {
            char = '<C-d>',
            func = function()
              local items = MiniPick.get_picker_items()
              if items == nil or #items == 0 then
                return
              end

              local matches = pick.get_picker_matches()
              if matches ~= nil then
                local current = matches.current
                local index = matches.current_ind -- save index for later
                vim.notify(
                  'Deleted buffer: '
                    .. vim.fs.basename(vim.api.nvim_buf_get_name(current.bufnr))
                )
                -- currently this doesn't properly delete the active buffer
                vim.api.nvim_buf_delete(current.bufnr, {})

                -- update picker https://old.reddit.com/r/neovim/comments/1dq1o56/minipick_moveset_match_cursor/
                table.remove(items, index)
                pick.set_picker_items(items)
                local mappings = pick.get_picker_opts().mappings
                for i = 1, index - 1 do
                  vim.api.nvim_input(mappings.move_down)
                end
              end
            end,
          },
        },
      })
    end, { desc = 'Buffers' })

    -- special paths
    pick.registry.special_paths = function()
      return pick.start({
        source = {
          name = 'Special Paths',
          items = require('config.utils').paths,
          choose = function(item)
            vim.cmd('e ' .. item)
          end,
          show = function(buf_id, items, query)
            pick.default_show(buf_id, items, query, { show_icons = true })
          end,
        },
      })
    end
    vim.keymap.set(
      'n',
      '<leader>fp',
      pick.registry.special_paths,
      { desc = 'Special Paths' }
    )

    -- diagnostics
    vim.keymap.set('n', '<leader>fd', function()
      extra.pickers.diagnostic({ scope = 'current' })
    end, { desc = 'Diagnostics (Buffer)' })
    vim.keymap.set('n', '<leader>fD', function()
      extra.pickers.diagnostic({ scope = 'all' })
    end, { desc = 'Diagnostics (All)' })

    -- git
    -- files
    vim.keymap.set('n', '<leader>gf', function()
      extra.pickers.git_files({ scope = 'tracked' })
    end, { desc = 'Files (Tracked)' })
    vim.keymap.set('n', '<leader>gF', function()
      extra.pickers.git_files({ scope = 'untracked' })
    end, { desc = 'Files (Untracked)' })
    vim.keymap.set('n', '<leader>gm', function()
      extra.pickers.git_files({ scope = 'modified' })
    end, { desc = 'Files (Modified)' })
    vim.keymap.set('n', '<leader>gi', function()
      extra.pickers.git_files({ scope = 'ignored' })
    end, { desc = 'Files (Ignored)' })

    -- hunks
    vim.keymap.set('n', '<leader>gh', function()
      extra.pickers.git_hunks({ path = vim.fn.expand('%'), n_context = 5 })
    end, { desc = 'Hunks (Buffer)' })
    vim.keymap.set('n', '<leader>gH', function()
      extra.pickers.git_hunks({ n_context = 5 })
    end, { desc = 'Hunks' })

    -- commits
    vim.keymap.set(
      'n',
      '<leader>gc',
      extra.pickers.git_commits,
      { desc = 'Commits' }
    )
    vim.keymap.set('n', '<leader>gC', function()
      extra.pickers.git_commits({ path = vim.fn.expand('%') })
    end, { desc = 'Commits (Buffer)' })

    -- vim
    vim.keymap.set('n', '<leader>fh', pick.builtin.help, { desc = 'Help' })
    vim.keymap.set(
      'n',
      '<leader>fl',
      extra.pickers.hl_groups,
      { desc = 'Highlights' }
    )

    -- keymaps
    vim.keymap.set(
      'n',
      '<leader>fk',
      extra.pickers.keymaps,
      { desc = 'Keymaps' }
    )

    -- options
    vim.keymap.set(
      'n',
      '<leader>fo',
      extra.pickers.options,
      { desc = 'Options (All)' }
    )
    -- vim.keymap.set('n', '<leader>fO', function()
    --   extra.pickers.options({ scope = 'buf' })
    -- end, { desc = 'Options (Buffer)' })

    -- resume
    vim.keymap.set('n', "'", pick.builtin.resume)

    -- registers
    vim.keymap.set(
      'n',
      '<leader>"',
      extra.pickers.registers,
      { desc = 'Registers' }
    )

    -- spell
    vim.keymap.set(
      'n',
      'z=',
      extra.pickers.spellsuggest,
      { desc = 'Spell Suggest' }
    )

    -- custom
    -- neovim config files
    pick.registry.config_files = function()
      return pick.builtin.files(nil, {
        source = {
          cwd = vim.fn.stdpath('config'),
        },
      })
    end
    vim.keymap.set(
      'n',
      '<leader>fn',
      pick.registry.config_files,
      { desc = 'Neovim Config Files' }
    )

    -- colorschemes
    pick.registry.colorschemes = function()
      return pick.start({
        source = {
          name = 'Colorschemes',
          items = vim.fn.getcompletion('', 'color'),
          choose = function(item)
            vim.cmd('colorscheme ' .. item)
          end,
          preview = function(buf_id, item)
            vim.cmd('colorscheme ' .. item)
          end,
        },
      })
    end
    vim.keymap.set(
      'n',
      '<leader>ft',
      pick.registry.colorschemes,
      { desc = 'Themes' }
    )

    -- commands
    -- mini builtin registry
    vim.keymap.set('n', '<leader>fc', function()
      local items =
        vim.tbl_keys(vim.tbl_extend('force', pick.registry, extra.pickers))
      table.sort(items)
      local source = {
        items = items,
        name = 'Registry',
        choose = function() end,
      }
      local chosen_picker_name = pick.start({ source = source })
      if chosen_picker_name == nil then
        return
      end
      return pick.registry[chosen_picker_name]()
    end, { desc = 'Commands (Builtin)' })
    vim.keymap.set(
      'n',
      '<leader>fC',
      extra.pickers.commands,
      { desc = 'Commands' }
    )

    -- highlights
    require('config.utils').apply_highlights({
      MiniPickPrompt = { link = 'MiniPickNormal' },
    })
  end,
}
