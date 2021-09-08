
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' 

Plug 'Raimondi/delimitMate'
Plug 'dense-analysis/ale'

" Format and Visual
Plug 'Yggdroot/indentLine'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'kkvh/vim-docker-tools'

" Comments
Plug 'scrooloose/nerdcommenter'

" Search 
Plug 'vim-scripts/grep.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Editor 
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'voldikss/vim-floaterm'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/CSApprox'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Code Managment
Plug 'tpope/vim-surround'
Plug 'codota/tabnine-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'terryma/vim-expand-region'

" Terminal
Plug 'Shougo/vimproc.vim', {'do': g:make}


" Spell Check
Plug 'dpelle/vim-languagetool'
let g:languagetool_jar='$HOME/dev/LanguageTool-5.2/languagetool-commandline.jar'

" Debugger
Plug 'puremourning/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['vscode-node-debug2', 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

" Snippets
Plug 'honza/vim-snippets'


" Theme
packadd! dracula
syntax enable
colorscheme dracula

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif


"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'

"let g:javascript_plugin_jsdoc = 1

"" PHP Bundle
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'stephpy/vim-php-cs-fixer'


"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" Statuslines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif




