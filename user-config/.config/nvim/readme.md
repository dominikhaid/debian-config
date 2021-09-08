# NVIM IDE

## STARTIFY SPLASH SCREEN

Configured to show recetly used files and some basic git information like the last commits,
changed files and also untracked files. Bookmarks are also shown and can be modified by editing /lua/config/bookmarks.lua. 

## LSP / TREESITTER

Treesitter is autmatically setup for tsx, json, jsdoc, bash, css, go, javascript, dockerfile, graphql, java, 
python, lua, rust, typescript, toml, php, json, yaml, html, scss.  Lsp can be easly installed with :LspInstall <lang>, 
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

## Rest / Http

A http client is integrated, for further instructions visit [link](https://github.com/NTBBloodbath/rest.nvim)

## Databse
A Databse client is integrated, for further instructions visit [vim-dadbod](https://github.com/tpope/vim-dadbod) and [ui](https://github.com/kristijanhusak/vim-dadbod-ui). Keybindings are set as alway in /lua/keymappings.lua.

## KEYBINDINGS

All Keybindings are located in /lua/keymappings.lua

## PLUGINS

Plugins are in Packer format, they are located in /lua/plugins.lua
Install all plugins can be done withe :PackerInstall, for updateing all plugins use :PackerUpdate.

## Settings 

General Nvim settings belong to /lua/settings.lua

## TROUBLESHOOTING / DEPENDENCIES

This Nvim setup is used to get install with our Debian Dev Environment install script.
It can be found here all nessary dependencies will be installed through the script.
Alternatively [here](https://github.com/dominikhaid/debian-install) is a list of things this setup depends on:


### Others

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
***dependencies that will be maybe needed for ninja or cmake will not be listed***


### LUA
```
sudo apt install -y lua5.3
npm i -g lua-fmt
```

### RUBY
```
sudo apt-get install -y ruby
```



