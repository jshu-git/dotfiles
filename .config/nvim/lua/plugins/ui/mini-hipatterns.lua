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

hipatterns.setup({
  highlighters = {
    hex_color = hipatterns.gen_highlighter.hex_color({
      style = 'inline',
      inline_text = ' ',
    }),
    -- mini.hues https://github.com/pkazmier/nvim/blob/main/lua/plugins/mini/hipatterns.lua#L63
    hl_color = {
      pattern = function(buf_id)
        if vim.bo[buf_id].filetype ~= 'lua' then
          return nil
        end
        return '%f[%w]()p%.[%w_%.]+()%f[%W]'
      end,
      group = function(_, match)
        local parts = vim.split(match, '.', { plain = true })
        ---@diagnostic disable-next-line: missing-parameter
        local color = vim.tbl_get(require('mini.hues').make_palette(), parts[2])
        return type(color) == 'string' and hipatterns.compute_hex_color_group(color, 'fg')
      end,
      extmark_opts = function(_, _, data)
        return {
          virt_text = { { ' ', data.hl_group } },
          virt_text_pos = 'inline',
          priority = 2000,
        }
      end,
    },
  },
})
