" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/Documents/dotfiles/symlink/.vim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'chr4/nginx.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'lumiliet/vim-twig'
Plug 'octref/RootIgnore'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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

" UtilSnips
 let g:UltiSnipsExpandTrigger="<tab>"
 let g:UltiSnipsJumpForwardTrigger="<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype plugin on

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set fillchars=""

set textwidth=79
" set colorcolumn=80
set number
set relativenumber
set nowrap

" Configuration of Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeRespectWildIgnore = 1
let NERDTreeIgnore = ['\.git$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 0
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeWinSize = 35

" vim-gitgutter
set updatetime=5000 " Update time for vim-gitgutter in ms

" UltiSnips
let g:UltiSnipsSnippetsDir = "~/Documents/dotfiles/symlink/.vim/snippets"

" CtrlP
let g:ctrlp_show_hidden = 1 " Also search hidden files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:easytree_flag_format = "%s %s"

" vim-markdown-preview
" Set to use grip and Github flavoured markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2
" let vim_markdown_preview_temp_file=1

" vim-table-mode
" Set mode for markdown tables
let g:table_mode_corner='|'

" Auto Commands (Launch on Login)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open NERDTree sidebar
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close NERDTree if it's the last window in vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" File Types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile */nginx/servers/*.conf set ft=nginx
