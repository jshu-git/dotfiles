require('debugprint').setup({
  keymaps = {
    normal = {
      plain_below = nil,
      plain_above = nil,
      variable_below = 'gl',
      variable_above = nil,
      variable_below_alwaysprompt = nil,
      variable_above_alwaysprompt = nil,
      textobj_below = 'g?o',
      textobj_above = 'g?O',
      toggle_comment_debug_prints = nil,
      delete_debug_prints = nil,
    },
    insert = {
      plain = nil,
      variable = nil,
    },
    visual = {
      variable_below = 'gl',
      variable_above = nil,
    },
  },
  display_counter = false,
  display_snippet = false,
  move_to_debugline = true,
  print_tag = '[JSHU DEBUGGING]',
  filetypes = {
    -- work
    ['perl'] = {
      left = '$log_global->log("',
      right = '',
      mid_var = '" .. Dumper($',
      right_var = ');',
    },
  },
})
