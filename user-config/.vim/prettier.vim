
let g:prettier#autoformat = 1
let g:prettier#quickfix_enabled = 1
let g:prettier#quickfix_auto_focus = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
command! -nargs=0 Prettier :CocCommand prettier.formatFile
