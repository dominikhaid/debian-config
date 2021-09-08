
" DOCKER
nmap <leader>d :DockerToolsToggle<CR>

"" GIT
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Git commit<CR>
noremap <leader>gu :Git add -u<CR>
"noremap <leader>ga :Git add file<CR>
noremap <leader>gaa :Git add -A<CR>
noremap <leader>gsh :Gpush<CR>
noremap <leader>gll :Gpull<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gd :Gvdiff<CR>
noremap <leader>gr :Gremove<CR>

nmap <leader>y :History:<CR>

"" FZF
nnoremap <silent> <leader>e :FZF -m<CR>
noremap <leader>ff :Files<CR>

"" nerdtree 
nmap <leader>ns :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeToggle<CR>

set termguicolors " this variable must be enabled for colors to be applied properly

"" terminal 
nnoremap <silent><leader>t :terminal<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

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
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
nnoremap <silent> <Leader>+ :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>


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


"" BUFFERS
"" buffer nav
noremap <leader>p :bp<CR>
noremap <leader>n :bn<CR>
noremap <leader>c :bd<CR>
"nnoremap <silent> <leader>b :Buffers<CR>

"" grep
 nnoremap <silent> <leader>fg :Rgrep<CR>

"" ctrlp
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>fb :Buffers<CR>

" hide show line numbers
nmap <leader>< :set number relativenumber<CR>
nmap <leader><leader>< :set number! relativenumber!<CR>


"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" SEARCH IN FILES
" show next results
nnoremap n nzzzv
nnoremap N Nzzzv

"" clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>
"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv


"" clipboard
noremap YY "+y<CR>
"noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

"" WTF
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')



" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

