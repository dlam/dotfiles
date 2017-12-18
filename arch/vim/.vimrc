syntax on

" Force indents to two spaces
set expandtab
set shiftwidth=2
set softtabstop=2

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
autocmd FileType javascript let b:codefmt_formatter = 'js-beautify'
Plug 'google/vim-glaive'

" Flow
Plug 'flowtype/vim-flow'

" Initialize plugin system
call plug#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
