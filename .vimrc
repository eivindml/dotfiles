let mapleader = " "
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>so :so %<cr>
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
set number relativenumber
highlight LineNr ctermfg=grey

"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
"  Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).

" Setup cursor change on insert mode
let &t_SR="\033[3 q" " 
let &t_SI="\033[6 q" " start insert mode, blinking underline cursor
let &t_EI="\033[2 q" " end insert mode, blinking block
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
autocmd VimEnter * redraw!
augroup END
" Slow to redram cursor
set ttimeout
set ttimeoutlen=1
set ttyfast
