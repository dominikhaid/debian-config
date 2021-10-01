local opts = {noremap = true, silent = true}
-- LSP Native
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

--Lsp Symbols
--vim.api.nvim_set_keymap("n", "g0", "<cmd>:SymbolsOutline<CR>", opts)
vim.api.nvim_set_keymap("n", "g0", "<cmd>:Telescope lsp_document_symbols<CR>", opts)
