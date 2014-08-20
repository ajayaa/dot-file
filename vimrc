call pathogen#infect()
" call pathogen#helptags()
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
filetype plugin on
set tags=./tags,tags;$HOME
let g:pep8_map='<leader>8'
set nu
set wildmenu
set ruler
set cmdheight=2
set hid
set ignorecase
set hlsearch
set showmatch
"set expandtab
"set smarttab
"set tabstop=4
set lbr
set tw=79
set ai "Auto indent
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
               \ endif

:colorscheme fruity
