" gl1 to set a numbered list in vimwiki gl* gl- etc...
" Mappings (non recursive)
"insert mode
" Quick tips:
" Press K to toggle help for whaever the cursor is pointing at
" Check out gi binding !!! will insert text in the last edit place !

syntax enable 
filetype plugin indent on       " load file type plugins + indentation
set cursorline
set clipboard+=unnamedplus
set nocompatible                " choose no compatibility with legacy vi
set expandtab                   " use spaces, not tabs (optional)
set encoding=utf-8
set showcmd                     " display incomplete commands
set backspace=indent,eol,start  " backspace through everything in insert mode
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set splitbelow splitright
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldmethod=marker
set showmatch
set nowrap
set number
let mapleader=","

" Remove default mapping
nnoremap <C-r> <nop>"{{{
nnoremap <C-p> <nop>
nnoremap <C-h> <nop>
inoremap jk <esc>"}}}

"visual mode
vnoremap Q ggVGdd"{{{
vnoremap b :g/^$/d<cr>
vnoremap l :left<cr>
vnoremap r :right<cr>
vnoremap c :center<cr>
xnoremap <c-p>  :m-2<CR>gv=gv
xnoremap <c-o> :m'>+<cr>gv=gv 
vnoremap <silent><space> zf 
vnoremap f gq"}}}


"normal mode
nnoremap r W"{{{
nmap <tab> gcap
nnoremap <silent> <space> za 
nnoremap 8 :vertical resize -5<cr>
nnoremap 7 :vertical resize +5<cr>
nnoremap glt :GenTocGFM<cr>
nnoremap e b
nnoremap z <c-r>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> f :Files<cr>
nnoremap  H :History<cr>
nnoremap m :Lines<cr>
nnoremap <c-j> <c-w>w
nnoremap <c-k> <c-w>w
nnoremap <C-S> :setlocal spell! spelllang=en_us<CR>
nnoremap <leader>c :w! \| !compiler "<c-r>%"<CR>}}}


""Autocmd
"augroup remember_folds"{{{
"  autocmd BufWinLeave *.* mkview
"  autocmd BufWinEnter *.* silent! loadview
"augroup END
augroup fileau
    autocmd!
    autocmd FileType markdown nnoremap <leader>b viw<esc>a__<esc>bi__<esc>w
    autocmd FileType c nnoremap <localleader>c :!gcc % -o %:r && ./%:r<CR>
    autocmd FileType markdown nnoremap <leader>p :!pandoc_md_to_html %<cr>
    autocmd FileType markdown nnoremap <leader>m :!pandoc_md_to_html_v2 %<cr>
    autocmd FileType markdown nnoremap <leader>g :!pandoc_md_to_pdf %<cr>
    autocmd FileType markdown nnoremap <leader>f :!pandoc_md_to_pdfv2 %<cr>
    autocmd FileType html nnoremap <silent> <leader>p :!librewolf %<cr>
    autocmd FileType markdown nnoremap <leader>B viw<esc>a`<esc>bi`<esc>w
    autocmd FileType markdown map <leader>j `>a```c<ESC>`<i```<ESC>
    autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END


" let
let g:clang_library_path='/usr/lib64/libclang.so.3.8'"{{{
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:clang_library_path='/usr/lib/llvm-3.8/lib'
let g:indentLine_fileTypeExclude = ["vimwiki", "coc-explorer", "help", "undotree", "diff"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "incv"
let g:indentLine_conceallevel = 2
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = "•"
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_color_term = 239
let s:default_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'"}}}



"plug
call plug#begin('~/.vim/plugged')"{{{
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()"}}}


