" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/Documents/dotfiles/symlink/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'SirVer/ultisnips'
Plug 'octref/RootIgnore'
Plug 'lumiliet/vim-twig'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "
nmap <leader>ne :NERDTree<cr>

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

" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin on
colorscheme dracula

set textwidth = 79
set colorcolumn = 80
set number
set relativenumber

" Configuration of Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeRespectWildIgnore = 1
let NERDTreeIgnore = ['\.git$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeWinSize = 45

" vim-gitgutter
let g:UltiSnipsSnippetsDir = "~/Documents/dotfiles/symlink/.vim/snippets"
set updatetime=1000 " Update time for vim-gitgutter in ms

" CtrlP
let g:ctrlp_show_hidden = 1 " Also search hidden files

" Lightline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ }

" Auto Commands (Launch on Login)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDTree sidebar
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close NERDTree if it's the last window in vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

