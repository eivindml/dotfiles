
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'octref/RootIgnore'
call plug#end()
let NERDTreeRespectWildIgnore=1
let g:NERDTreeWinSize=45
colorscheme dracula
set laststatus=2
"set formatoptions+=a
" Update time for vim-gitgutter in ms
set updatetime=1000
let g:UltiSnipsSnippetsDir="~/.vim/snippets"
set textwidth=79
"set linebreak 
"set nolist  " list disables linebreak
set colorcolumn=80

set number
set relativenumber
syntax on

let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

let mapleader = " "
nmap <leader>ne :NERDTree<cr>
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>
nmap <leader>so :so %<cr>

"make jj do esc"
inoremap jj <Esc>

" Move between windows using tab
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close NERDTree if it's the last window in vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"
" Insert newline while still in normal mode
nmap <S-o> O<Esc>
nmap <CR> o<Esc>

let NERDTreeShowHidden=1
