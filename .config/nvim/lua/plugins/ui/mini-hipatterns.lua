local hipatterns = require('mini.hipatterns')

-- local nord_colors = {}
-- for palette, colors in pairs(require('nord.colors').palette) do
--   if palette ~= 'none' then
--     ---@diagnostic disable-next-line: param-type-mismatch
--     for color, hex in pairs(colors) do
--       nord_colors[palette .. '.' .. color] = {
--         pattern = function(buf_id)
--           if vim.bo[buf_id].filetype ~= 'lua' then
--             return nil
--           end
--           return palette .. '.' .. color
--         end,
--         group = hipatterns.compute_hex_color_group(hex, 'bg'),
--       }
--     end
--   end
-- end

local highlighters = vim.tbl_deep_extend('force', {
  hex_color = hipatterns.gen_highlighter.hex_color(),
}, {})
-- }, nord_colors)

hipatterns.setup({
  highlighters = highlighters,
  -- highlighters = {
  --   hex_color = hipatterns.gen_highlighter.hex_color({
  --     style = 'inline',
  --     inline_text = ' ',
  --   }),
  --   nord_colors,
  -- mini.hues https://github.com/pkazmier/nvim/blob/main/lua/plugins/mini/hipatterns.lua#L63
  -- hl_color = {
  --   pattern = function(buf_id)
  --     if vim.bo[buf_id].filetype ~= 'lua' then
  --       return nil
  --     end
  --     return '%f[%w]()c%.[%w_%.]+()%f[%W]'
  --   end,
  --   group = function(_, match)
  --     local parts = vim.split(match, '.', { plain = true })
  --     local palette = {
  --       ['polar_night.origin'] = '#2E3440',
  --       ['polar_night.bright'] = '#3B4252',
  --       ['polar_night.brighter'] = '#434C5E',
  --       ['polar_night.brightest'] = '#4C566A',
  --       ['polar_night.light'] = '#616E88',
  --       ['snow_storm.origin'] = '#D8DEE9',
  --       ['snow_storm.brighter'] = '#E5E9F0',
  --       ['snow_storm.brightest'] = '#ECEFF4',
  --       ['frost.polar_water'] = '#8FBCBB',
  --       ['frost.ice'] = '#88C0D0',
  --       ['frost.artic_water'] = '#81A1C1',
  --       ['frost.artic_ocean'] = '#5E81AC',
  --       ['aurora.red'] = '#BF616A',
  --       ['aurora.orange'] = '#D08770',
  --       ['aurora.yellow'] = '#EBCB8B',
  --       ['aurora.green'] = '#A3BE8C',
  --       ['aurora.purple'] = '#B48EAD',
  --     }
  --     local color = vim.tbl_get(palette, parts[2])
  --     return type(color) == 'string' and hipatterns.compute_hex_color_group(color, 'fg')
  --   end,
  --   extmark_opts = function(_, _, data)
  --     return {
  --       virt_text = { { ' ', data.hl_group } },
  --       virt_text_pos = 'inline',
  --       priority = 2000,
  --     }
  --   end,
  -- },
  -- },
})
