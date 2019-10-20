let mapleader = " "
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>so :so %<cr>
nmap <leader>p :CtrlP<cr>
" Insert newline while still in normal mode
nmap <S-o> O<Esc>
nmap <CR> o<Esc>
" Move between windows using tab
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>
" Change mode with 'jj'
inoremap jj <Esc>
syntax on
filetype plugin on
set fillchars=""
set textwidth=79
set nowrap
