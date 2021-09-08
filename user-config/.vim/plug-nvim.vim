
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

Plug 'Shougo/vimproc.vim', {'do': g:make}
Plug 'dpelle/vim-languagetool'
let g:languagetool_jar='$HOME/dev/LanguageTool-5.2/languagetool-commandline.jar'



