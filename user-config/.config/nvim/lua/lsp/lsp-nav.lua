require "navigator".setup(
  {
    debug = false,
    code_action_icon = " ",
    width = 0.75,
    height = 0.3,
    preview_height = 0.35,
    lspinstall = true,
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    on_attach = function(client, bufnr)
    end,
    default_mapping = true,
    keymaps = {{key = "gs", func = "signature_help()"}},
    treesitter_analysis = true,
    code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    icons = {
      code_action_icon = " ",
      diagnostic_head = "🐛",
      diagnostic_head_severity_1 = "🈲"
    },
    lsp = {
      format_on_save = true
    }
  }
)
