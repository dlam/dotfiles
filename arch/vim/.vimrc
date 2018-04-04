syntax on

" Force indents to two spaces
set expandtab
set shiftwidth=4
set softtabstop=4

" Highlight trailing whitespace
hi ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'NLKNguyen/papercolor-theme'
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'allow_italic': 1,
  \       'transparent_background': 1
  \     }
  \   }
  \ }

" JavaScript syntax highliting
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

" Codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" autocmd FileType javascript let b:codefmt_formatter = 'js-beautify'
Plug 'google/vim-glaive'

" Flow
Plug 'flowtype/vim-flow'
let g:flow#autoclose = 1

" Initialize plugin system
call plug#end()

" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()

set background=dark
colorscheme PaperColor
