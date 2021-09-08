local status, lualine = pcall(require, "lualine")

if (not status) then
  return
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "onedark",
    padding = 2,
    upper = true,
    section_separators = {"", ""},
    component_separators = {"", ""},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", condition = conditions.check_git_workspace, icon = ""},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}, symbols = {error = " ", warn = " ", info = " ", hint = " "}},
      "encoding",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {"nvim-tree"}
}
