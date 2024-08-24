local function total_lines()
  return vim.api.nvim_buf_line_count(0) .. 'L'
end
local function file_size()
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
