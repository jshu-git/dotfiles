require('mini.align').setup({
  mappings = { start = '&', start_with_preview = 'sA' },
  -- j cycles
  modifiers = {
    j = function(_, opts)
      local next_option = ({
        left = 'center',
        center = 'right',
        right = 'none',
        none = 'left',
      })[opts.justify_side]
      opts.justify_side = next_option or 'left'
    end,
  },
})
