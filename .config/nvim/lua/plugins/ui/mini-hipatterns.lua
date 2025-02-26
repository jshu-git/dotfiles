local hipatterns = require('mini.hipatterns')
local colors = {}
for color, hex in pairs(require('palette')) do
  colors['p.' .. color] = {
    pattern = function(buf_id)
      if vim.bo[buf_id].filetype ~= 'lua' then
        return nil
      end
      return 'p.' .. color
    end,
    group = hipatterns.compute_hex_color_group(hex, 'bg'),
  }
end

-- print(vim.inspect(colors))
-- {
--   ["p.bg"] = "#1b1e28",
--   ["p.bg10"] = "#2c303f",
--   ["p.bg20"] = "#3f4457",
--   ["p.bg30"] = "#525970",
--   ["p.bg50"] = "#7c85a3",
--   ["p.blue"] = "#89b4fa",
--   ["p.fg"] = "#cdd6f4",
--   ["p.green"] = "#a6e3a1",
--   ["p.red"] = "#f38ba8",
--   ["p.syntax"] = "#5de4c7",
--   ["p.yellow"] = "#f9e2af"
-- }

local highlighters = vim.tbl_deep_extend('force', {
  hex_color = hipatterns.gen_highlighter.hex_color(),
}, colors)

hipatterns.setup({
  highlighters = highlighters,
})
-- hipatterns.setup({
--   highlighters = {
--     hex_color = hipatterns.gen_highlighter.hex_color({
--       style = 'inline',
--       inline_text = ' ',
--     }),
--     -- hl_color = {
--     --   pattern = function(buf_id)
--     --     if vim.bo[buf_id].filetype ~= 'lua' then
--     --       return nil
--     --     end
--     --     return '%f[%w]()p%.[%w_%.]+()%f[%W]'
--     --   end,
--     --   group = function(_, match)
--     --     local parts = vim.split(match, '.', { plain = true })
--     --     ---@diagnostic disable-next-line: missing-parameter
--     --     local color = vim.tbl_get(require('mini.hues').make_palette(), parts[2])
--     --     return type(color) == 'string' and hipatterns.compute_hex_color_group(color, 'fg')
--     --   end,
--     --   extmark_opts = function(_, _, data)
--     --     return {
--     --       virt_text = { { ' ', data.hl_group } },
--     --       virt_text_pos = 'inline',
--     --       priority = 2000,
--     --     }
--     --   end,
--     -- },
--   },
-- })
