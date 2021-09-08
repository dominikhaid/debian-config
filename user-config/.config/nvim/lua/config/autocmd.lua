vim.cmd(
  [[
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
augroup END

autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
set autoread

]]
)
