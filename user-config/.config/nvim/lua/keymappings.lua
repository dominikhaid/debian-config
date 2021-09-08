local utils = require("utils")
utils.map("n", "<C-l>", "<cmd>noh<CR>") -- Clear highlights
utils.map("i", "jk", "<Esc>") -- jk to escape

-- Clap
utils.map("n", "<Leader>fh", "<cmd>Clap history<cr>")
utils.map("n", "<Leader>fhc", "<cmd>Clap command_history<cr>")

-- Easy-motion
utils.map("n", "<Leader>s", "<Plug>(easymotion-overwin-f2)")
utils.map("v", "<Leader>l", "<Plug>(easymotion-bd-jk)")
utils.map("n", "<Leader>l", "<Plug>(easymotion-overwin-line)")
utils.map("v", "<Leader>w", "<Plug>(easymotion-bd-w)")
utils.map("n", "<Leader>w", "<Plug>(easymotion-overwin-w)")

-- DOCKER
utils.map("n", "<leader>d", "<cmd>DockerToolsToggle<CR>", {noremap = true})

--GI,
utils.map("n", "<leader>gdl", ":DiffviewOpen HEAD~1 --cached<CR>", {noremap = true})
utils.map("n", "<leader>gd", ":DiffviewOpen<CR>", {noremap = true})
utils.map("n", "<leader>gb", ":Git blame<CR>", {noremap = true})

utils.map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", {noremap = true})
--utils.map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", {noremap = true})
utils.map("n", "<leader>gr", "<cmd>Telescope repo list<cr>", {noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<leader>gs",
  ":FloatermNew --height=1.0 --width=1.0 --wintype=float --autoclose=2 lazygit<CR>",
  {noremap = true, silent = true}
)

utils.map("n", "<leader>gph", ":Git push<CR>", {noremap = true})
utils.map("n", "<leader>gpl", ":Git pull<CR>", {noremap = true})

--File:
utils.map("n", "<leader>gbw", ":GBrowse<CR>", {noremap = true})
utils.map("n", "<leader>gm", ":Gvdiffsplit!<CR>", {noremap = true})
utils.map("n", "<leader>grf", ":GRemove<CR>", {noremap = true})
utils.map("n", "<leader>gmt", ":Git mergetool<CR>", {noremap = true})

--  Markdown
utils.map("n", "<leader>md", ":Glow<CR>", {noremap = true})

--Telescope
utils.map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
utils.map("n", "<Leader>fc", "<cmd>Telescope commands<cr>")
utils.map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
utils.map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
utils.map("n", "<leader>fm", "<cmd>Telescope media_files<cr>", {noremap = true})
--utils.map("n", "<leader>fh", "<cmd>Cheatsheet<cr>", {noremap = true})
utils.map("n", "<leader>fn", "<cmd>Telescope node_modules list<cr>", {noremap = true})
utils.map("n", "<leader>fl", "<cmd>Telescope bookmarks<cr>", {noremap = true})
utils.map("n", "<leader>fp", '<cmd>lua require("telescope").extensions.packer.plugins(opts)<cr>', {noremap = true})

--HELP
utils.map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", {noremap = true})
utils.map("n", "<leader>y", ":History:<CR>", {noremap = true})

-- NVIM Tree
--utils.map("n", "<leader>nt", ":NvimTreeToggle<CR>", {noremap = true})
--utils.map("n", "<leader>nr", ":NvimTreeRefresh<CR>", {noremap = true})
--utils.map("n", "<leader>ns", ":NvimTreeFindFile<CR>", {noremap = true})

-- Terminal
vim.api.nvim_set_keymap("n", "<leader>t", ":terminal<CR>", {noremap = true})
vim.api.nvim_set_keymap(
  "n",
  "<F12>",
  ":FloatermToggle --height=1.0 --width=1.0 --wintype=float<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "t",
  "<F12>",
  "<C-\\><C-n>:FloatermToggle --height=1.0 --width=1.0 --wintype=float<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<F11>", ":FloatermNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<F11>", "<C-\\><C-n>:FloatermNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap(
  "n",
  "<F10>",
  ":FloatermNew --height=1.0 --width=1.0 --wintype=float<CR>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>f",
  ":FloatermNew --height=1.0 --width=1.0 --wintype=float --autoclose=2 broot -sdph<CR>",
  {noremap = true, silent = true}
)

--  EDITOR
-- wirte quite
--utils.map('c',  'W! w!',        {noremap=true})
--utils.map('c',  'Q! q!',        {noremap=true})
--utils.map('c',  'Qall! qall!',  {noremap=true})
--utils.map('c',  'Wq wq',        {noremap=true})
--utils.map('c',  'Wa wa',        {noremap=true})
--utils.map('c',  'wQ wq',        {noremap=true})
--utils.map('c',  'WQ wq',        {noremap=true})
--utils.map('c',  'W w ',         {noremap=true})
--utils.map('c',  'Q q ',         {noremap=true})
--utils.map('c',  'Qall qall',    {noremap=true})
utils.map("c", "w!!", 'execute "silent! write !sudo tee % >/dev/null" <bar> edit!', {noremap = true})

-- Split
utils.map("n", "<Leader>h", ":<C-u>split<CR>", {noremap = true})
utils.map("n", "<Leader>v", ":<C-u>vsplit<CR>", {noremap = true})
utils.map("n", "<Leader>+", ':exe "vertical resize +5"<CR>', {noremap = true})
utils.map("n", "<Leader>-", ':exe "vertical resize -5"<CR>', {noremap = true})

-- NAVIGATION
-- tabs
utils.map("n", "<C-Tab>", "gt", {noremap = true})
utils.map("n", "<Tab>", "gt", {noremap = true})
utils.map("n", "<S-Tab>", "gT", {noremap = true})
utils.map("n", "<S-t>", ":tabnew<CR>", {silent = true, noremap = true})

-- WINDOWS
-- switching windows
utils.map("n", "<C-j>", "<C-w>j", {noremap = true})
utils.map("n", "<C-j>", "<C-w>j", {noremap = true})
utils.map("n", "<C-k>", "<C-w>k", {noremap = true})
utils.map("n", "<C-l>", "<C-w>l", {noremap = true})
utils.map("n", "<C-h>", "<C-w>h", {noremap = true})

-- BUFFERS
-- buffer nav
utils.map("n", "<leader>p", ":bp<CR>", {noremap = true})
utils.map("n", "<leader>n", ":bn<CR>", {noremap = true})
utils.map("n", "<leader>c", ":bd<CR>", {noremap = true})

-- hide show line numbers
utils.map("n", "<leader><", ":set number relativenumber<CR>", {noremap = true})

-- SEARCH IN FILES
-- show next results
utils.map("n", "n", "nzzzv", {noremap = true})
utils.map("n", "N", "Nzzzv", {noremap = true})

-- clean search (highlight)
utils.map("n", "<leader><space>", ":noh<cr>", {noremap = true})
utils.map("n", "<leader>.", ":lcd %:p:h<CR>", {noremap = true})

-- Vmap for maintain Visual Mode after shifting > and <
utils.map("v", "<", "<gv", {noremap = true})
utils.map("v", ">", ">gv", {noremap = true})

-- clipboard
utils.map("n", "YY", "+y<CR>", {noremap = true})
utils.map("n", "<leader>p", "+gP<CR>", {noremap = true})
utils.map("n", "XX", "+x<CR>", {noremap = true})

-- session management
utils.map("n", "<leader>so", ":OpenSession<Space>", {noremap = true})
utils.map("n", "<leader>ss", ":SaveSession<Space>", {noremap = true})
utils.map("n", "<leader>sd", ":DeleteSession<CR>", {noremap = true})
utils.map("n", "<leader>sc", ":CloseSession<CR>", {noremap = true})

-- Formatter
utils.map("n", "<leader>fo", ":Format<CR>", {noremap = true, silent = true})

-- LuaSnip Compe
-- Map tab to the above tab complete functions
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "compe#confirm('<CR>')", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Map compe confirm and complete functions
vim.api.nvim_set_keymap("i", "<c-q", "compe#close()", {noremap = true, silent = true, expr = true})

--Minimap
vim.api.nvim_set_keymap("n", "<leader>m", "<cmd>Minimap<CR>", {silent = true, noremap = true})

local opts = {noremap = true, silent = true}

-- See `:help vim.lsp.*` for documentation on any of the below functions
--vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) --NOT WORKING
--vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts) --NOT WORKING
--vim.api.nvim_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
--vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
--vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
--vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

vim.api.nvim_set_keymap("n", "g0", "<cmd>:SymbolsOutline<CR>", opts)

--LSP SAGA
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", opts)
vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
vim.api.nvim_set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cd", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cD", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", opts)
vim.api.nvim_set_keymap("n", "[e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]e", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)

-- Debug
vim.api.nvim_set_keymap("n", "<leader>da", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dso", "<cmd>lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dsi", "<cmd>lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", opts)

-- `code_action` is a superset of vim.lsp.buf.code_action and you'll be able to
-- use this mapping also with other language servers
vim.api.nvim_set_keymap("n", "<A-CR>", '<Cmd>lua require("jdtls").code_action()<CR>', opts)
vim.api.nvim_set_keymap("n", "<A-CR>", '<Esc><Cmd>lua require("jdtls"").code_action(true)<CR>', opts)
vim.api.nvim_set_keymap("v", "<leader>r", '<Cmd>lua require("jdtls").code_action(false, "refactor")<CR>', opts)

vim.api.nvim_set_keymap("n", "<A-o>", '<Cmd>lua require"jdtls".organize_imports()<CR>', opts)
vim.api.nvim_set_keymap("n", "crv", '<Cmd>lua require("jdtls").extract_variable()<CR>', opts)
vim.api.nvim_set_keymap("v", "crv", '<Esc><Cmd>lua require("jdtls").extract_variable(true)<CR>', opts)

vim.api.nvim_set_keymap("n", "crc", '<Cmd>lua require("jdtls").extract_constant()<CR>', opts)
vim.api.nvim_set_keymap("v", "crc", '<Esc><Cmd>lua require("jdtls").extract_constant(true)<CR>', opts)
vim.api.nvim_set_keymap("v", "crm", '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>', opts)

-- If using nvim-dap
-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
vim.api.nvim_set_keymap("n", "<leader>dm", "<Cmd>lua require('jdtls.dap').setup_dap_main_class_configs()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dt", '<Cmd>lua require("dapui").toggle()<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>dtn", '<Cmd>lua require"jdtls".test_nearest_method()<CR>', opts)

--lua debug
--
vim.api.nvim_set_keymap("n", "<leader>dl", "<Cmd>lua require'osv'.run_this()<CR>", opts)

--debug Telescope
--
vim.api.nvim_set_keymap("n", "<leader>dc", "<Cmd>:Telescope dap commands<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dv", "<Cmd>:Telescope dap variables<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>db", "<Cmd>:Telescope dap list_breakpoints<CR>", opts)

-- db
--
vim.api.nvim_set_keymap("n", "<leader>du", ":DBUIToggle<CR> ", opts)
vim.api.nvim_set_keymap("n", "<leader>df", ":DBUIFindBuffer<CR> ", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", ":DBUIRenameBuffer<CR> ", opts)
vim.api.nvim_set_keymap("n", "<leader>dl", ":DBUILastQueryInfo<CR>", opts)
