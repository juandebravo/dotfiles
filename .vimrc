
" ======= General configuration =======

set number         "Show line number
syntax on          "Highlight syntax
set encoding=utf-8 "Use UTF-8 as the default text encoding

" Autoload plugins
execute pathogen#infect()


" ======= Search settings ======
set incsearch        "Find the next match as we type the search
set hlsearch         "Highlight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks


" ====== Indentation ======
set autoindent    "Autoindent (index following lines to the indentation of previous one)
set smartindent
set smarttab
set ts=4          "Set tab space = 4 (tabstop)
set shiftwidth=4  "Set >> and << operator to 4 spaces
set expandtab     "Use the appropriate number of spaces to insert a <Tab>


" ====== Show vertical line ======
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey


" ====== Status improvements ======
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2


" Settings for editing C files
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 expandtab

" Open NERDTree if no file argument
autocmd vimenter * if !argc() | NERDTree | endif

" ====== Functions ======
"
" Example from developerWorks:
"   http://www.ibm.com/developerworks/linux/library/l-vim-script-1
"
function! ToggleSyntax()
   if exists("g:syntax_on")
      syntax off
   else
      syntax enable
   endif
endfunction
"
" Toggle syntax setting on/off
map <F2> :execute ToggleSyntax()<CR>

" map - to move the current line one line below
nnoremap - ddp

" unmap -
 
" map _ to move the current line one line above
nnoremap _ ddkP

" Open NERDTree
map <F3> :NERDTreeToggle<CR>
 


"""""""""""""""""""""
"   DOCUMENTATION   "
"""""""""""""""""""""

" say something
"     echo "something"
 
" say and write a message
"     echom "OLA KE ASE"
 
" see written messages
"     messages
 
" view/unview line numbers
"     set number / set nu / set nonumber / set nonu
 
" check the number value
"     set number?
 
" toggle the number value
"     set number!
 
" relativenumber: show a line number based on the current line
"     set relativenumber
 
" PROTIP: use always (x)noremap instead of (x)map to avoid recursion and side
" effects
 
" define a map for a specific mode: i (insert), n (normal), v (visual)
"   nmap \ dd
"   vmap \ U
 
" define a map for insert mode than deletes a line upon pressing CTRL + d
"     imap <c-d> <esc>ddi
 
" define a map for insert mode that 
"   upcase the current word upon pressing CTRL + u
"     imap <c-u> <esc>viwU<esc>ea
 
" define a map for normal mode that 
"   upcase the current word upon pressing CTRL + u
"     nmap <c-u> viwU<esc>
 
" define a leader/prefix for every mapping
"     let mapleader = ","
 
" define a map to open the .vimrc file
"    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
 
" define a map to reload the .vimrc file
"    nnoremap <leader>sv :source $MYVIMRC<cr>
 
" define an abbrev that converts a simple character to a longer string
" iabbrev fn function() {}

" The main differente between maps and abbreviations is that abbrev only
"    takes place if the typed characters are standalone 
"    (not part of a longer word)
 
