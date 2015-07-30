" Theme
syntax enable
colorscheme monokai

" Line numbers
set number

" Force indents to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Highlight and automatically remove trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * :%s/\s\+$//e
