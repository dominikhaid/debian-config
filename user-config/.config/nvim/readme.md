# NVIM

Nvim is a Termianl based text editor. The strenght of Nvim is its accessibility and ist super fast. Very input can be done using the keyboard only, but mouse is also supported. We use Nvim for more then just plain text editing, we have a highly optimized setup for development that can easly keep up with modern days IDE´s like VScode. Below you will find a detailed description of the components, plugins and key bindings we use.

## STARTIFY SPLASH SCREEN

Configured to show recetly used files and some basic git information like the last commits,
changed files and also untracked files. Bookmarks are also shown and can be modified by editing /lua/config/bookmarks.lua.

## LSP / TREESITTER

Treesitter is autmatically setup for tsx, json, jsdoc, bash, css, go, javascript, dockerfile, graphql, java,
python, lua, rust, typescript, toml, php, json, yaml, html, scss. Lsp can be easly installed with :LspInstall <lang>,
for forther information please visited [lspinstall](https://github.com/kabouzeid/nvim-lspinstall).

## Completion & Snippets

Snippets are provides by [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) LSP and TAB9.
Settings can be found under /lua/snippets.lua.

## FORMATING

Format on save by default is enabled for .js, .rs, .go, .java, .rs, .sh, .lua, .css, .ts, .php, .tsx, .jsx, .md.
Settings can be modified /lua/config/formater.lua.

## DAP / DEBUGGING

Debugging is by default configrued for the following languages.

- JavaScript (node, chrome, firefox)
- DotNet
- Go
- Lua
- Java
- Php
- Python
- Rust / C++

All debug adapters are located in /lua/dap/w
There is an additional configuration for Java in /lua/jdtls_setup.lua

## REST / HTTP

A http client is integrated, for further instructions visit [link](https://github.com/NTBBloodbath/rest.nvim)

## DATABASE

A Databse client is integrated, for further instructions visit [vim-dadbod](https://github.com/tpope/vim-dadbod) and [ui](https://github.com/kristijanhusak/vim-dadbod-ui). Keybindings are set as alway in /lua/keymappings.lua.

## KEYBINDINGS

All Keybindings are located in /lua/keymappings.lua, blow you will find a list of the most common ones.

### METAKEYS

- Vim `<leader>`
- Git `<leader>g`
- Debug `<leader>d`
- File `<leader>f`
- Command `<leader>c`
- Window `<leader>w`
- Quickfix `<leader>q`
- Loclist `<leader>l`
- Code `<space>c` TODO
- Database `<leader>b`
- Rest `<leader>r`
  **NOTE: leader is by default ,**

### Folding

- Unfold all file `zR`
- Fold all file `zM`
- Unfold all selection `zC`
- Toggle fold selection `za`
- Toggle fold selection `zA`
- Open fold selection `zo`
- Open fold all selection `zO`
- Close fold selection `zC`
- Close all fold selection `zc`

### MOVEMENT

- Move selection line up `v K`
- Move selection line down `v J`
- Jump `<leader>j`
- Jump over Windoe `<leader>jw`
- Jump to line `<leader>l`
- Jump to sign `<leader>s`
- Jump next fucntion start `]m`
- Jump next class start `]]`
- Jump next fucntion end `]M`
- Jump next class end `][`
- Jump previous function start `[m`
- Jump previous class start `[[`
- Jump previous function end `[M`
- Jump previous class end `[]`

### COPY & PASTE

- Copy `y`
- Copy selection to Clipboard `v y`
- Copy line `yy`
- Copy line to ClipBoard `YY`
- Paste appending `p`
- Paste prepanding `P`

### SELECTION

- Select inside `v i "`
- Select outside `v a "`
- Treesitter `gnn`
- Node incremental `grn`
- Scope incremental `grc`
- Node decremental `grm`
- Select inner function `if`
- Select outer function `af`
- Select outer class `ac`
- Select class inner `ic`

### EMMET

- `div+div>p>span+em^bq`
- `div>(header>ul>li*2>a)+footer>p`
- `div#header+div.page+div#footer.class1.class2.class3`
- `td[title="Hello world!" colspan=3]`
- `ul>li.item$@-3*5`
- `p>{Click }+a{here}+{ to continue}`

[DOCS](https://docs.emmet.io/abbreviations/syntax/)

### SURROUNDINGS

- change '' to "" `cs'"`
- change tag to "" `cst"`
- remove "" `ds"`
- selection `V S <p>`
- word `ysiw"`
- tag `ysi<p>`
- line `yss)`

### LSP

- Go refrence `gr`
- Go definition `gd`
- Code actions `<space>ca`
- Code Lens `<space>la`
- Diagnostics Quickfix `<space>q`
- Format `<space>f`
- Type definition `<space>D`
- Document symbol `g0`
- Workspace Symbol `workspace symbol`
- Go implementation `gi`
- Rename `<space>rn`
- Show definition `gp`
- Signaturehelp `gs`
- Hover doc `K`
- Function outer `df`
- Class outer `dF`

### WORKSPACE

- Split `<leader>h`
- Split vertical `<leader>v`
- Close buffer `<leader>q`
- Broot `<leader>br`
- File browser `<leader>b`
- Arrange Windows `<leader>H/L/J/K`
- Find buffer `<leader>fb`
- Find files `<leader>ff`
- File grep `<leader>fg`
- Fles Media `<leader>fm`
- Terminal `<leader>t`
- CWD to file `<leader>.`
- CWD to parent `<leader>..`

### TELESCOPE

- Open vertical `<C-v>`
- Open horizontal `<C-s>`
- Open tab `<C-t>`
- Mark `tab`
- Up Down `<C-n/p>`
- Selection to Quickfix `<M-q>`
- All to quickfix `<C-q>`
- Scroll preview `<C-d/u`
- Show Quickfix `<leader>qf`
- Show loclist `<leader>lf`

### NAVIGATOR

- previous item in list `<C>p`
- next item in list `<C>n`
- move cursor to preview (windows move to bottom view point) `<Ctrl-w>j`
- move cursor to list (windows move to up view point) `<Ctrl-w>k`
- open preview file in nvim with vsplit `<C-v>`
- open preview file in nvim with split `<C-s>`
- previous page in listview `<C-b>`
- next page in listview `<C-f>`
- save the modification to preview window to file `<C-s>`

### SNIPPETS

1. Firendly-Snippets
2. Tabnine
3. LuaSnip
4. Compe

### GIT

#### Basic

- LazyGit `<leader>gl`
- Git merge/diff `<leader>gm`
- Git merge tool `<leader>gmt`
- Git remove `<leader>grf`
- Git Commits `<leader>gc`
- Git blame `<leader>gb`
- Git branch commits `<leader>gbc`
- Git branch `<leader>gbr`
- Git repos `<leader>gr`
- Git status `<leader>gs`
- Show file in browser `<leader>gbw`
  **NOTE: Git repos is just a local search**

#### Diffview

- Git merge `<leader>gd`
- Go file `gf`
- Stage `-`
- Stage all `S`
- Unstage all `U`
- Revert `X`
- File history `gfh`
- Show last commit `gdl`

##### Hunks

- Git go next hunk `]c`
- Git go prev hunk `[c`
- Git stage hunk `<leader>hs`
- Git undo stage hunk `<leader>hu`
- Git reset hunk `<leader>hr`
- Git reset buffer `<leader>hR `
- Git preview hunk `<leader>hp`
- Git blame hunk `<leader>hb`
- Git stage buffer `<leader>hS`
- Git undo buffer `<leader>hU`

### DEBUG

- Add breakpont `<leader>db`
- Start debbuger `<leader>ds`
- Debug lua `<leader>dl`
- Debug java `<leader>dj`
- Debug Commands `<leader>dc`
- Debug Variables `<leader>dv`
- Debug Brealpoints `<leader>db`
- Debug Ui `<leader>dt`
- Debug REPL open `<leader>do`
- Debug step over `<leader>dso`
- Debug step into `<leader>dsi`

### DATABASE

- DB Ui `<leader>bu`
- DB Find `<leader>bf`
- DB Rename `<leader>brr`
- DB LastQuery `<leader>bl`

### REST

- Run http `<leader>r`
- Run Preview `<leader>rp`
- Run Last `<leader>rl`

### DOCKER

- Show docker panel `<leader>d`

## PLUGINS

Plugins are in Packer format, they are located in /lua/plugins.lua
Install all plugins can be done withe :PackerInstall, for updateing all plugins use :PackerUpdate. Below a list of the plugins we use right now. They all can be found on Github.

### Utils

    - wbthomason/packer.nvim
    - sudormrfbin/cheatsheet.nvim
    - folke/which-key.nvim
    - ojroques/nvim-lspfuzzy
    - kabouzeid/nvim-lspinstall
    - neovim/nvim-lspconfig
    - tjdevries/nlua.nvim
    - vim-scripts/CSApprox
    - xolox/vim-session

#### Scratchpad

    - metakirby5/codi.vim

### Ui

    - liuchengxu/vim-clap
    - hoob3rt/lualine.nvim
    - RishabhRD/popfix
    - mhinz/vim-startify
    - fussenegger/nvim-fz
    - akinsho/nvim-bufferline.lua
    - wfxr/minimap.vim
    - nvim-telescope/telescope.nvim
    - nvim-lua/popup.nvim
    - nvim-lua/plenary.nvim

### Workspace / Movement / Selection

    - terryma/vim-expand-region
    - mg979/vim-visual-multi
    - scrooloose/nerdcommenter
    - easymotion/vim-easymotion
    - pope/vim-surround
    - voldikss/vim-floaterm

### Icons

    - ryanoasis/vim-devicons
    - kyazdani42/nvim-web-devicons

### Markdown

    - ellisonleao/glow.nvim

### Rest

    - NTBBloodbath/rest.nvim

### Database

    - kristijanhusak/vim-dadbod-ui
    - tpope/vim-dadbod

### Lsp & Coding Helps

    - mattn/emmet-vim
    - cohama/lexima.vim
    - mhartington/formatter.nvim
    - ray-x/navigator.lua
    - ray-x/guihua.lua
    - nvim-treesitter/nvim-treesitter
    - simrat39/symbols-outline.nvim

### Files

    - nvim-telescope/telescope-media-files.nvim
    - nvim-telescope/telescope-packer.nvim
    - nvim-telescope/telescope-node-modules.nvim
    - dhruvmanila/telescope-bookmarks.nvim

### Docker

    - kkvh/vim-docker-tools

### Debug

    - jbyuki/one-small-step-for-vimkind
    - rcarriga/nvim-dap-ui
    - mfussenegger/nvim-dap
    - nvim-telescope/telescope-dap.nvim
    - theHamsta/nvim-dap-virtual-text

### Languages

    - simrat39/rust-tools.nvim
    - akinsho/flutter-tools.nvim
    - fussenegger/nvim-jdtl

### Snippets

    - tzachar/compe-tabnine
    - hrsh7th/nvim-compe
    - rafamadriz/friendly-snippets
    - L3MON4D3/LuaSnip

### Git

    - lewis6991/gitsigns.nvim
    - sindrets/diffview.nvim
    - tpope/vim-fugitive
    - cljoly/telescope-repo.nvim
    - tpope/vim-rhubarb

## SETTINGS

General Nvim settings belong to /lua/settings.lua

## TROUBLESHOOTING / DEPENDENCIES

This NVIM setup is used to get install with our Debian Dev Environment install script.
It can be found [here](https://github.com/dominikhaid/debian-install).

### LSP Servers and other dependencies

```
// Install LLVM TOOLS for Debian
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
pip3 install ueberzug
npm i -g yarn diagnostic-languageserver prettier
```

### BASH

```
wget https://github.com/patrickvane/shfmt/releases/download/master/shfmt_linux_amd64 -P $HOME
mv $HOME/shfmt_linux_amd64 /usr/bin/shfmt
sudo chmod 755 /usr/bin/shfmt
```

### DOTNET

```
wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update; \
sudo apt-get install -y apt-transport-https && \
sudo apt-get update && \
sudo apt-get install -y dotnet-sdk-5.0

sudo apt-get update; \
sudo apt-get install -y apt-transport-https && \
sudo apt-get update && \
sudo apt-get install -y aspnetcore-runtime-5.0

git clone https://github.com/Samsung/netcoredbg.git $HOME/dev/netcoredbg
cd $HOME/dev/netcoredbg
mkdir build
cd build
CC=clang CXX=clang++ cmake ..
make
sudo make install

```

### PHP

```
sudo apt isntall -y php-dev php-xdebug
sudo apt install -y wget php-cli php-zip unzip

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
apt update -y
apt upgrade -y
apt install -y php8.0-{mysql,cli,common,imap,ldap,xml,fpm,curl,mbstring,zip}

wget -O composer-setup.php https://getcomposer.org/installer
php composer-setup.php --install-dir=/usr/local/bin --filename=composer

git clone https://github.com/xdebug/vscode-php-debug.git $HOME/dev/vscode-php-debug
cd $HOME/dev/vscode-php-debug
npm install && npm run build
```

### Java

```
npm i -g prettier-plugin-java

sudo apt install -y python3-venv
sudo apt install -y maven

curl -s "https://get.sdkman.io" | bash
echo "source /etc/profile.d/java.sh" | tee -a  $HOME/.pathrc
echo "source ~/.sdkman/bin/sdkman-init.sh" | tee -a  $HOME/.pathrc

git clone https://github.com/microsoft/java-debug $HOME/dev/java-debug
cd $HOME/dev/java-debug
LANG=C ./mvnw clean install

git clone https://github.com/microsoft/vscode-java-test $HOME/dev/vscode-java-test
cd $HOME/dev/vscode-java-test
npm install
npm run build-plugin

git clone https://github.com/eclipse/eclipse.jdt.ls.git $HOME/dev/eclipse.jdt.ls
cd $HOME/dev/eclipse.jdt.ls
./mvnw clean install -DskipTests

git clone https://github.com/dgileadi/vscode-java-decompiler.git $HOME/dev/vscode-java-decompiler
cd $HOME/dev/vscode-java-decompiler
npm i

python3 -m venv $HOME/dev/virtualenvs/debugpy
$HOME/dev/virtualenvs/debugpy/bin/python3 -m pip install debugpy
```

### Rust

```
cd $HOME && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
$HOME/.cargo/bin/cargo install sd
$HOME/.cargo/bin/cargo install broot
$HOME/.cargo/bin/cargo install procs
broot --install

```

### JavaScript

```
npm i -g eslint typescript diagnostic-languageserver

git clone https://github.com/microsoft/vscode-node-debug2.git $HOME/dev/vscode-node-debug2
cd $HOME/dev/vscode-node-debug2
npm install
npm i –g gulp
gulp build

git clone https://github.com/Microsoft/vscode-chrome-debug $HOME/dev/vscode-chrome-debug
cd $HOME/dev/vscode-chrome-debug
npm install
npm run build
```

### GO

```
cd $HOME
wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz
tar -xvf go1.16.4.linux-amd64.tar.gz
mv go /usr/local

/usr/local/go/bin/go get -u github.com/go-delve/delve/cmd/dlv
cd $HOME
git clone https://github.com/charmbracelet/glow.git
cd glow

/usr/local/go/bin/go build
cd $HOME
git clone https://github.com/lz4/lz4
cd lz4
make
sudo make install

ln -s $HOME/glow/glow /usr/bin/glow
rm -rf $HOME/go1.16.4.linux-amd64.tar.gz
```

### Nvim

```
git clone https://github.com/neovim/neovim $HOME/.local/share/nvim
cd $HOME/.local/share/nvim
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/share/nvim"
make install

cd $HOME && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd $HOME/.vim/plugged/coc.nvim/
yarn install && yarn build
python3 -m pip install --user --upgrade pynvim

cd $SCRIPTPATH
mkdir -p $HOME/.vim/pack/themes/start

cd $HOME/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula

cd $HOME
git clone https://github.com/dirkvdb/ffmpegthumbnailer.git
cd ffmpegthumbnailer
cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_GIO=ON -DENABLE_THUMBNAILER=ON .
make
sudo -S make install

cd $HOME
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
curl -L git.io/antigen > antigen.zsh
git clone https://github.com/sdushantha/fontpreview && cd fontpreview && sudo make install
ln -s $HOME/fontpreview/fontpreview $USER_HOME/.local/bin/fontpreview

cd $HOME
git clone https://github.com/wbthomason/packer.nvim $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
ln -s $USER_HOME/.local/share/nvim/bin/nvim /usr/bin/nvim
```

**_ dependencies that will be maybe needed for ninja or cmake will not be listed_**

### LUA

```
sudo apt install -y lua5.3
npm i -g lua-fmt
```

### RUBY

```
sudo apt-get install -y ruby
```
