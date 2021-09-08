local saga = require "lspsaga"
-- "single" "double" "round" "plus"
saga.init_lsp_saga {
  definition_preview_icon = "  ",
  border_style = "round",
  rename_prompt_prefix = "➤",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-d>",
    scroll_up = "<C-u>"
  },
  use_saga_diagnostic_sign = true,
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  dianostic_header_icon = "   ",
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  "
}
