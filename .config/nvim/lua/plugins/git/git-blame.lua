return {
  "FabijanZulj/blame.nvim",
  config = function()
    -- custom blame format
    local date_author_message = function(line_porcelain, config, idx)
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
              textValue = os.date(
                config.date_format,
                line_porcelain.committer_time
              ),
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
      date_format = "%m/%d/%y",
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
