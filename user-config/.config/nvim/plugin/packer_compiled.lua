-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/dominik/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/dominik/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/dominik/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/dominik/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/dominik/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CSApprox = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/CSApprox"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["minimap.vim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/minimap.vim"
  },
  neogit = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/neogit"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-fzy"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-fzy"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["one-small-step-for-vimkind"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rest.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/rest.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-bookmarks.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/telescope-bookmarks.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-clap"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-clap"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-docker-tools"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-docker-tools"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-expand-region"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-github-dashboard"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-github-dashboard"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-misc"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-session"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-session"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/dominik/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
