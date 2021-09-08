--Floatterm
vim.api.nvim_command("hi! link Floaterm ColorColumn")
vim.api.nvim_command("hi! link FloatermBorder Title")

-- :highlight [Group] [key=value]
--Lsp
--vim.api.nvim_command("hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow")
--vim.api.nvim_command("hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow")
--vim.api.nvim_command("hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow")
--
vim.api.nvim_command("hi! link  LspSagaFinderSelection TabLineSel")
vim.api.nvim_command("hi! link  LspFloatWinNormal ColorColumn")

vim.api.nvim_command("hi! link  TargetWord Title")
vim.api.nvim_command("hi! link  ReferencesCount DiffChange")
vim.api.nvim_command("hi! link  DefinitionCount DiffChange")
vim.api.nvim_command("hi! link  TargetFileName Title")

vim.api.nvim_command("hi! link  DefinitionIcon Question")
vim.api.nvim_command("hi! link  ReferencesIcon Directory")

vim.api.nvim_command("hi! link  SagaShadow ColorColumn")
vim.api.nvim_command("hi! link  LspSagaFinderSelection SpecialComment")

vim.api.nvim_command("hi! link  DiagnosticError ErrorMsg")
vim.api.nvim_command("hi! link  DiagnosticWarning WarningMsg")
vim.api.nvim_command("hi! link  DiagnosticInformation DiffChange")
vim.api.nvim_command("hi! link  DiagnosticHint SpecialComment")

vim.api.nvim_command("hi! link  DefinitionPreviewTitle WarningMsg")
vim.api.nvim_command("hi! link  LspSagaCodeActionTitle SpecialComment")
vim.api.nvim_command("hi! link  LspSagaBorderTitle SpecialComment")

vim.api.nvim_command("hi! link  DiagnosticTruncateLine FoldColumn")
vim.api.nvim_command("hi! link  ProviderTruncateLine FoldColumn")
vim.api.nvim_command("hi! link  LspSagaShTruncateLine FoldColumn")
vim.api.nvim_command("hi! link  LspSagaDocTruncateLine FoldColumn")
vim.api.nvim_command("hi! link  LineDiagTuncateLine FoldColumn")
vim.api.nvim_command("hi! link  LspSagaCodeActionTruncateLine FoldColumn")

vim.api.nvim_command("hi! link  LspFloatWinBorder SpecialComment")
vim.api.nvim_command("hi! link  LspSagaRenameBorder SpecialComment")
vim.api.nvim_command("hi! link  LspSagaHoverBorder SpecialComment")
vim.api.nvim_command("hi! link  LspSagaCodeActionBorder SpecialComment")
vim.api.nvim_command("hi! link  LspSagaSignatureHelpBorder SpecialComment")
vim.api.nvim_command("hi! link  LspSagaDefPreviewBorder SpecialComment")
vim.api.nvim_command("hi! link  LspLinesDiagBorder SpecialComment")

vim.api.nvim_command("hi! link  LspSagaCodeActionContent Title")
vim.api.nvim_command("hi! link  LspSagaRenamePromptPrefix Title")
vim.api.nvim_command("hi! link  LspSagaAutoPreview ColorColumn")

--Telescope
vim.api.nvim_command("hi! link  TelescopeSelection Visual")
vim.api.nvim_command("hi! link  TelescopeSelectionCaret Visual")
vim.api.nvim_command("hi! link  TelescopeMultiSelection IncSearch")
vim.api.nvim_command("hi! link  TelescopeNormal ColorColumn")

vim.api.nvim_command("hi! link TelescopeBorder SpecialComment")
vim.api.nvim_command("hi! link TelescopePromptBorder Title")
vim.api.nvim_command("hi! link TelescopeResultsBorder SpecialComment")
vim.api.nvim_command("hi! link TelescopePreviewBorder Title")
vim.api.nvim_command("hi! link TelescopeMatching Title")
vim.api.nvim_command("hi! link TelescopePromptPrefix Visual")
