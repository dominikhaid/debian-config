"" DOCKER
nmap <leader>d :DockerToolsToggle<CR>

set termguicolors
noremap YY +y<CR>
noremap <leader>p +gP<CR>
noremap XX +x<CR>

""  EDITOR
"" wirte quite
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"" split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>
nnoremap <silent><leader>+ :exe "vertical resize +5"<CR>
nnoremap <silent><leader>- :exe "vertical resize -5"<CR>

"" NAVIGATION
"" tabs
noremap <C-Tab> gt
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" WINDOWS
"" switching windows
noremap <C-j> <C-w>j
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" grep
 nnoremap <silent><leader>fg :Rgrep<CR>

"" ctrlp
cnoremap <C-P><C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent><leader>fb :Buffers<CR>

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" SEARCH IN FILES
" show next results
nnoremap n nzzzv
nnoremap N Nzzzv

"" clean search (highlight)
nnoremap <silent><leader><space> :noh<cr>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" clipboard
noremap YY +y<CR>
"noremap <leader>p "+gP<CR>
noremap XX +x<CR>

"" WTF
noremap <silent><expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent><expr> k (v:count == 0 ? 'gk' : 'k')

map <leader>s <Plug>(easymotion-overwin-f2)
map <leader>l <Plug>(easymotion-overwin-line)
map <leader>j <Plug>(easymotion-bd-e)
map <leader>jw <Plug>(easymotion-overwin-w)

"" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

noremap <C-A> <Home>
noremap <C-E> <End>
noremap <C-space> ^
noremap <S-space> $
noremap <leader>w :w!<cr>
nnoremap <leader><leader>w :wa!<cr>
