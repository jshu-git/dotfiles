local file_size = function()
  local size = vim.fn.getfsize(vim.fn.getreg('%'))
  if size <= 0 then
    return ''
  elseif size < 1024 then
    return string.format('%dB', size)
  elseif size < 1048576 then
    return string.format('%.2fKB', size / 1024)
  else
    return string.format('%.2fMB', size / 1048576)
  end
end

local total_lines = function()
  local lines = vim.api.nvim_buf_line_count(0)
  return string.format('%dL', lines)
end

require('lualine').setup({
  options = {
    component_separators = '',
    -- section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      {
        function()
          if require('grapple').exists() then
            return ' '
          else
            return ''
          end
        end,
        padding = { left = 1, right = 0 },
      },
      { 'filename', path = 1 },
    },
    lualine_x = { file_size },
    lualine_y = { 'filetype' },
    lualine_z = { total_lines },
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
