local statusline = require('mini.statusline')
statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      mode = string.upper(mode)

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

      local filetype = function()
        local filetype = vim.bo.filetype
        if filetype == '' then
          return ''
        end
        filetype = require('mini.icons').get('filetype', filetype) .. ' ' .. filetype
        return string.format('%s', filetype)
      end

      local progress = function()
        local cur = vim.fn.line('.')
        local total = vim.fn.line('$')
        if cur == 1 then
          return 'TOP'
        elseif cur == total then
          return 'BOT'
        else
          return string.format('%2d%%%%', math.floor(cur / total * 100))
        end
      end

      local lines = string.format('%d', vim.fn.line('$'))

      return statusline.combine_groups({
        -- a
        { hl = mode_hl, strings = { mode } },
        -- b
        {
          hl = 'MiniStatuslineDevinfo',
          strings = {
            statusline.section_git({ trunc_width = 40 }),
            statusline.section_diff({ trunc_width = 75 }),
            statusline.section_diagnostics({ trunc_width = 75 }),
          },
        },
        '%<', -- Mark general truncate point
        -- c
        { hl = 'MiniStatuslineFilename', strings = { statusline.section_filename({ trunc_width = 140 }) } },
        '%=', -- End left alignment
        -- x
        { hl = 'MiniStatuslineFilename', strings = { file_size() } },
        -- y
        { hl = 'MiniStatuslineFileinfo', strings = { filetype() } },
        -- z
        { hl = 'MiniStatuslineModeNormal', strings = { progress(), '/', lines } },
      })
    end,
  },
})
