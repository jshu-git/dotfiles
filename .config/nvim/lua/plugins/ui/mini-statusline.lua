local statusline = require('mini.statusline')
statusline.setup({
  content = {
    active = function()
      -- a
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      mode = string.upper(mode)

      -- b
      -- local git = statusline.section_git({ trunc_width = 40 })
      -- local diff = statusline.section_diff({ trunc_width = 75 })
      -- local custom_diff = function()
      --   return vim.b.minidiff_summary_string or ''
      -- end
      local custom_git = function()
        return vim.b.minigit_summary_string and (' ' .. vim.b.minigit_summary_string) or ''
      end

      local diagnostics = statusline.section_diagnostics({
        trunc_width = 75,
        icon = '',
        signs = {
          ERROR = require('utils').signs.Error,
          WARN = require('utils').signs.Warn,
          INFO = require('utils').signs.Info,
          HINT = require('utils').signs.Hint,
        },
      })

      -- c
      -- local filename = statusline.section_filename({ trunc_width = 140 })
      local custom_filename = '%f %m%r'

      -- x
      local file_size = function()
        local size = vim.fn.getfsize(vim.fn.getreg('%'))
        if size <= 0 then
          return nil
        elseif size < 1024 then
          return string.format('%dB', size)
        elseif size < 1048576 then
          return string.format('%.2fKB', size / 1024)
        else
          return string.format('%.2fMB', size / 1048576)
        end
      end

      -- y
      local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
      local custom_fileinfo = string.match(fileinfo, '^[^%s]+%s+[^%s]+')

      -- z
      local progress = function()
        local cur = vim.fn.line('.')
        local total = vim.fn.line('$')
        if cur == 1 then
          return ' TOP'
        elseif cur == total then
          return ' BOT'
        else
          return string.format(' %2d%%%%', math.floor(cur / total * 100))
        end
      end

      local search = statusline.section_searchcount({ trunc_width = 75 })
      if search ~= '' then
        search = '󰍉 ' .. search
      end

      local lines = string.format('%dL', vim.fn.line('$'))

      local grapple = function()
        if require('grapple').exists() then
          return ''
        elseif require('grapple').exists({ scope = 'global' }) then
          return ''
        else
          return ''
        end
      end

      return statusline.combine_groups({
        -- a
        { hl = mode_hl, strings = { mode } },
        -- b
        { hl = 'MiniStatuslineDevinfo', strings = { custom_git(), diagnostics } },
        '%<', -- Mark general truncate point
        -- c
        { hl = 'MiniStatuslineFilename', strings = { custom_filename } },
        '%=', -- End left alignment
        -- x
        { hl = 'MiniStatuslineFilename', strings = { file_size() } },
        -- y
        { hl = 'MiniStatuslineFileinfo', strings = { custom_fileinfo } },
        -- z
        { hl = mode_hl, strings = { progress(), '/', lines } },
        { hl = 'MiniStatuslineModeReplace', strings = { search } },
        { hl = 'MiniStatuslineModeOther', strings = { grapple() } },
      })
    end,
  },
})

-- require('lualine').setup({
--   options = {
--     component_separators = '',
--     -- section_separators = '',
--   },
--   sections = {
--     lualine_a = { 'mode' },
--     lualine_b = { 'branch', 'diff', 'diagnostics' },
--     lualine_c = {
--       {
--         function()
--           if require('grapple').exists() then
--             return ' '
--           else
--             return ''
--           end
--         end,
--         padding = { left = 1, right = 0 },
--       },
--       { 'filename', path = 1 },
--     },
--     lualine_x = { file_size },
--     lualine_y = { 'filetype' },
--     lualine_z = { total_lines },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {},
--     lualine_x = {},
--     lualine_y = {},
--     lualine_z = {},
--   },
-- })
