local hipatterns = require('mini.hipatterns')

local nord_colors = {}
for palette, colors in pairs(require('nord.colors').palette) do
  if palette ~= 'none' then
    ---@diagnostic disable-next-line: param-type-mismatch
    for color, hex in pairs(colors) do
      nord_colors[palette .. '.' .. color] = {
        pattern = palette .. '.' .. color, -- polar_night.origin
        group = hipatterns.compute_hex_color_group(hex, 'bg'),
      }
    end
  end
end

local highlighters = {
  hex_color = hipatterns.gen_highlighter.hex_color(),
}

hipatterns.setup({
  highlighters = vim.tbl_deep_extend('force', highlighters, nord_colors),
})

-- local nord_colors = {}
-- -- flatten nord.colors palette
-- for palette, colors in pairs(require('nord.colors').palette) do
--   if palette ~= 'none' then
--     ---@diagnostic disable-next-line: param-type-mismatch
--     for color, hex in pairs(colors) do
--       nord_colors[palette .. '.' .. color] = hex
--     end
--   end
-- end
-- print(vim.inspect(nord_colors))
-- {
--   ["aurora.green"] = "#A3BE8C",
--   ["aurora.orange"] = "#D08770",
--   ["aurora.purple"] = "#B48EAD",
--   ["aurora.red"] = "#BF616A",
--   ["aurora.yellow"] = "#EBCB8B",
--   ["frost.artic_ocean"] = "#5E81AC",
--   ["frost.artic_water"] = "#81A1C1",
--   ["frost.ice"] = "#88C0D0",
--   ["frost.polar_water"] = "#8FBCBB",
--   ["polar_night.bright"] = "#3B4252",
--   ["polar_night.brighter"] = "#434C5E",
--   ["polar_night.brightest"] = "#4C566A",
--   ["polar_night.light"] = "#616E88",
--   ["polar_night.origin"] = "#2E3440",
--   ["snow_storm.brighter"] = "#E5E9F0",
--   ["snow_storm.brightest"] = "#ECEFF4",
--   ["snow_storm.origin"] = "#D8DEE9"
-- }
