return {
  "FabijanZulj/blame.nvim",
  config = function()
    -- custom blame format
    local date_author_message = function(line_porcelain, config, idx)
      -- from gitsigns
      local function get_relative_time(timestamp)
        local function to_relative_string(time, divisor, time_word)
          local num = math.floor(time / divisor)
          if num > 1 then
            time_word = time_word .. "s"
          end
          return num .. " " .. time_word .. " ago"
        end
        local current_timestamp = os.time()
        local elapsed = current_timestamp - timestamp
        local minute_seconds = 60
        local hour_seconds = minute_seconds * 60
        local day_seconds = hour_seconds * 24
        local month_seconds = day_seconds * 30
        local year_seconds = month_seconds * 12
        if elapsed < minute_seconds then
          return to_relative_string(elapsed, 1, "second")
        elseif elapsed < hour_seconds then
          return to_relative_string(elapsed, minute_seconds, "minute")
        elseif elapsed < day_seconds then
          return to_relative_string(elapsed, hour_seconds, "hour")
        elseif elapsed < month_seconds then
          return to_relative_string(elapsed, day_seconds, "day")
        elseif elapsed < year_seconds then
          return to_relative_string(elapsed, month_seconds, "month")
        else
          return to_relative_string(elapsed, year_seconds, "year")
        end
      end

      local hash = string.sub(line_porcelain.hash, 0, 7)
      local line_with_hl = {}
      local is_committed = hash ~= "0000000"

      if is_committed then
        local summary
        if #line_porcelain.summary > config.max_summary_width then
          summary = string.sub(
            line_porcelain.summary,
            0,
            config.max_summary_width - 1
          ) .. "…"
        else
          summary = line_porcelain.summary
        end

        line_with_hl = {
          idx = idx,
          values = {
            {
              textValue = get_relative_time(line_porcelain.committer_time),
              hl = "NonText",
            },
            {
              textValue = line_porcelain.author,
              hl = "Comment",
            },
            {
              textValue = summary,
              hl = "NormalNC",
            },
          },
          format = "%s %s %s",
        }
      else
        line_with_hl = {
          idx = idx,
          values = {
            {
              textValue = "Not Committed",
              hl = "Whitespace",
            },
          },
          format = "%s",
        }
      end
      return line_with_hl
    end

    require("blame").setup({
      merge_consecutive = true,
      format_fn = date_author_message,
    })

    vim.keymap.set(
      "n",
      "<leader>gb",
      "<cmd>BlameToggle<cr>",
      { desc = "Blame" }
    )
  end,
}
