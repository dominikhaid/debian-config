vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
vim.api.nvim_command("set foldlevel=20")
