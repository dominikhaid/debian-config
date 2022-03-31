
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb' 

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
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Terminal
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'


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


" Statuslines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif




