local total_lines = function()
  return vim.api.nvim_buf_line_count(0) .. 'L'
end
local file_size = function()
  local size = vim.fn.getfsize(vim.fn.expand('%:p')) / 1024
  if size < 0 then
    return ''
  end
  return string.format('%.2f', size) .. 'KB'
end

require('lualine').setup({
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha' },
  },
  sections = {
    lualine_a = {
      { 'mode' },
    },
    lualine_b = {
      { 'branch' },
      { 'diff' },
      { 'diagnostics' },
    },
    lualine_c = {
      { 'filename', path = 1 },
    },
    lualine_x = {
      { file_size },
    },
    lualine_y = {
      { 'filetype' },
    },
    lualine_z = {
      {
        function()
          if require('grapple').exists() then
            return ' ' .. require('grapple').name_or_index()
          else
            return ''
          end
        end,
        padding = { left = 1, right = 0 },
      },
      { total_lines },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})

-- local statusline = require('mini.statusline')
-- statusline.setup({
--   content = {
--     active = function()
--       local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
--       local git = statusline.section_git({ trunc_width = 40 })
--       local diff = statusline.section_diff({ icon = '', trunc_width = 75 })
--       local diagnostics = statusline.section_diagnostics({
--         icon = '',
--         signs = {
--           ERROR = require('config.utils').signs.Error,
--           WARN = require('config.utils').signs.Warn,
--           INFO = require('config.utils').signs.Info,
--           HINT = require('config.utils').signs.Hint,
--         },
--         trunc_width = 75,
--       })
--       local filename = statusline.section_filename({ trunc_width = 140 })
--       local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
--       local total_lines = function()
--         return vim.api.nvim_buf_line_count(0) .. 'L'
--       end
--
--       return statusline.combine_groups({
--         { hl = mode_hl, strings = { mode } },
--         { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics } },
--         '%<',
--         { hl = 'MiniStatuslineFilename', strings = { filename } },
--         '%=',
--         { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
--         { hl = mode_hl, strings = { total_lines() } },
--       })
--     end,
--   },
-- })
