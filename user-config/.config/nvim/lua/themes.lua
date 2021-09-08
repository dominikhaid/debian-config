local home = os.getenv("HOME")
local fn = vim.fn
local execute = vim.api.nvim_command

local one_path = home .. "/.vim/pack/themes/start/one"
if fn.empty(fn.glob(one_path)) > 0 then
  execute("!git clone https://github.com/rakr/vim-one " .. one_path)
end

local sonokai_path = home .. "/.vim/pack/themes/start/sonokai"
if fn.empty(fn.glob(sonokai_path)) > 0 then
  execute("!git clone https://github.com/sainnhe/sonokai " .. sonokai_path)
end

local edge_path = home .. "/.vim/pack/themes/start/edge"
if fn.empty(fn.glob(edge_path)) > 0 then
  execute("!git clone https://github.com/sainnhe/edge " .. edge_path)
end

local material_path = home .. "/.vim/pack/themes/start/material"
if fn.empty(fn.glob(material_path)) > 0 then
  execute("!git clone https://github.com/kaicataldo/material.vim " .. material_path)
end

local onedark_path = home .. "/.vim/pack/themes/start/onedark"
if fn.empty(fn.glob(onedark_path)) > 0 then
  execute("!git clone https://github.com/joshdick/onedark.vim " .. onedark_path)
end

local dracula_path = home .. "/.vim/pack/themes/start/dracula"
if fn.empty(fn.glob(dracula_path)) > 0 then
  execute("!git clone https://github.com/dracula/vim.git " .. dracula_path)
end

vim.api.nvim_command("colorscheme onedark")

--vim.api.nvim_command("packadd! dracula")
--vim.api.nvim_command("packadd! one")
--vim.api.nvim_command("colorscheme dracula"
--vim.g.edge_style = "aura"
--vim.g.edge_enable_italic = 1
--vim.g.edge_disable_italic_comment = 1

--vim.g.material_theme_style = "darker-community"
--vim.g.material_terminal_italics = 1
