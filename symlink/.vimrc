" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/Documents/dotfiles/symlink/.vim/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'octref/RootIgnore'
Plug 'scrooloose/nerdtree'
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

" vim-markdown-preview
let vim_markdown_preview_hotkey='<leader>m'
  

" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin on

" set textwidth=79
" set colorcolumn=80
set number
set relativenumber
set nowrap

set backspace=indent,eol,start

" Apperance
highlight VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE ctermfg=60
highlight NonText cterm=NONE ctermbg=NONE gui=NONE guibg=NONE ctermfg=60
set fillchars=""

" Configuration of Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let loaded_netrwPlugin=1
let NERDTreeRespectWildIgnore = 1
" let NERDTreeIgnore = ['\.git$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeWinSize = 35


" Auto Commands (Launch on Login)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDTree sidebar
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close NERDTree if it's the last window in vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


