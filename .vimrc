call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on

if &t_Co >= 256 || has("gui_running")
   colorscheme mustang
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

"function to strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

au BufRead,BufNewFile *.pp set filetype=ruby

autocmd BufWritePre *.rb,*.pp :call <SID>StripTrailingWhitespaces()
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

"change the mapleader from \ to ,
let mapleader=","

"make jj work like escape
imap jj <Esc>
filetype on
filetype plugin on
filetype indent on
set nocompatible
set nowrap
set tabstop=4
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=4
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set title
set noerrorbells
set nobackup
set noswapfile
set pastetoggle=<F2>
set tabstop=8
set shiftwidth=8
set expandtab
set bg=dark

vmap Q gq
nmap Q gqap
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
cmap w!! w !sudo tee % >/dev/null
nnoremap ; :

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

let g:vmail_flagged_color = "ctermfg=red ctermbg=black cterm=bold"
