" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details
" For multi-byte character support (CJK support, for example): set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1



execute pathogen#infect()
cnoremap sudow w !sudo tee % >/dev/null

filetype on
filetype plugin indent on
syntax on

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1
set nocp
set noswapfile
set ruler           " Show the line and column number of the cursor position, separated by a comma.
set numberwidth=1 "set to minimum width between edge and line number
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set showcmd         " Show (partial) command in status line.
set number          " Show line numbers.
set hlsearch  " When there is a previous search pattern, highlight all its matches.
set incsearch       " While typing a search command, show immediately where the so far typed pattern matches.
set ignorecase      " Ignore case in search patterns.
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters.
set autoindent      " Copy indent from current line when starting a new line (typing <CR> in Insert mode or when using the \"o\" or \"O\" command).
set cindent
set cm=blowfish2    " Set encryption method

" Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands
" and when 'autoindent' is on. To insert a real tab when
" 'expandtab' is on, use CTRL-V <Tab>.
set expandtab       

" When on, a <Tab> in front of a line inserts blanks
" according to 'shiftwidth'. 'tabstop' is used in other
" places. A <BS> will delete a 'shiftwidth' worth of space
" at the start of the line.
set smarttab        

" When a bracket is inserted, briefly jump to the matching
" one. The jump is only done if the match can be seen on the
" screen. The time to show the match can be set with
" 'matchtime'.
set showmatch       

" Influences the working of <BS>, <Del>, CTRL-W
" and CTRL-U in Insert mode. This is a list of items,
" separated by commas. Each item allows a way to backspace
" over something.
set backspace=2    

"set formatoptions=c,q,r,t 
" This is a sequence of letters which describes how
" automatic formatting is to be done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
" c         Auto-wrap comments using textwidth, inserting
"           the current comment leader automatically.
" q         Allow formatting of comments with "gq".
" r         Automatically insert the current comment leader
"           after hitting <Enter> in Insert mode. 
" t         Auto-wrap text using textwidth (does not apply
"           to comments)

" When set to "dark", Vim will try to use colors that look
" good on a dark background. When set to "light", Vim will
" try to use colors that look good on a light background.
" Any other value is illegal.
set background=dark

"set mouse=a         " Enable the use of the mouse.

let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <silent> <C-l> :nohl<CR><C-l> " <Ctrl-l> redraws the screen and removes any search highlighting.
