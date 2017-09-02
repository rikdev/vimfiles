" # Encoding options
if has('multi_byte')
  " character encoding used in Vim
  set encoding=utf-8
endif


" # Get the defaults that most users want
source $VIMRUNTIME/defaults.vim


" # Variables
let g:user_vimfiles = expand('<sfile>:p:h')


" # Options
" numbering as in :options
" ## 1 important
" key sequence to toggle paste mode
set pastetoggle=<F12>

" ## 2 moving around, searching and patterns
" list of flags specifying which commands wrap to another line
set whichwrap+=<,>,[,]
" many jump commands don't move the cursor to the first non-blank
" character of a line
set nostartofline

" ignore case when using a search pattern
set ignorecase
" override 'ignorecase' when pattern has upper case characters
set smartcase

" ## 3 tags
if has('cscope')
  " use cscope for tag commands
  set cscopetag
  " give messages when adding a cscope database
  set cscopeverbose

  if has('quickfix')
    " when to open a quickfix window for cscope
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
  endif
endif

" ## 4 displaying text
" don't long lines wrap
set nowrap

" don't redraw while executing macros
set lazyredraw

" show whitespace chars
set list
" list of strings used for list mode
set listchars=tab:→\ ,space:·,trail:·,extends:»,precedes:«,conceal:◘,nbsp:○

" show the line number for each line
set number
" show the relative line number for each line
set relativenumber

" ## 5 syntax, highlighting and spelling
if has('extra_search')
  " highlight all matches for the last used search pattern
  set hlsearch
endif
if has('syntax')
  " highlight the screen line of the cursor
  set cursorline

  " list of accepted languages
  set spelllang+=ru
  " file that "zg" adds good words to
  let &spellfile=g:user_vimfiles . '/spell/user.'. &encoding . '.add'
endif

" ## 6 multiple windows
" 0, 1 or 2; when to use a status line for the last window
" 2 - always
set laststatus=2

if has('statusline')
  " alternate format to be used for a status line
  set statusline+=%n\ "buffer number
  set statusline+=%<%f "relative path to the file in the buffer
  set statusline+=%m%r%w\ "[modified flag][readonly flag][preview flag]
  set statusline+=%y "type of file in the buffer
  set statusline+=[%{empty(&fenc)?&enc:&fenc}/%{&ff}] "[fileencoding/fileformat]
  set statusline+=%= "separation point between left and right aligned items
  set statusline+=%(\ %k%)\ \|\ "value of "b:keymap_name" or 'keymap'
  set statusline+=Ln\ %-9.(%l/%L%)\ "line number/number of lines,
  "virtual column number/line width
  set statusline+=Col\ %-7.(%v/%{strdisplaywidth(getline('.'))}%)\ "
  set statusline+=%P "percentage through file of displayed window
endif

" ## 13 selecting text
" when to start Select mode instead of Visual mode
set selectmode=key
" "startsel" and/or "stopsel"; what special keys can do
set keymodel+=startsel,stopsel

" ## 14 editing text
if has('comments')
  " definition of what comment lines look like
  set comments=
endif
" list of flags that tell how automatic formatting works
" r - automatically insert the current comment leader after hitting
" <Enter> in Insert mode.
" o - automatically insert the current comment leader after hitting 'o' or
" 'O' in Normal mode.
" j - to where it makes sense, remove a comment leader when joining lines
set formatoptions+=roj

if has('insert_expand')
  " whether to use a popup menu for Insert mode completion
  " longest - only insert the longest common text of the matches
  set completeopt+=longest
endif

" list of dictionary files for keyword completion
if filereadable('/usr/share/dict/words')
  set dictionary+=/usr/share/dict/words
endif

" don't use two spaces after '.' when joining a line
set nojoinspaces

" ## 15 tabs and indenting
" number of spaces a <Tab> in the text stands for
set tabstop=4
" number of spaces used for each step of (auto)indent
set shiftwidth=4
" a <Tab> in an indent inserts 'shiftwidth' spaces
set smarttab

" automatically set the indent of a new line
set autoindent

if has('smartindent')
  " do clever autoindenting
  set smartindent
endif

" ## 16 folding
if has('folding')
  " value for 'foldlevel' when starting to edit a file
  set foldlevelstart=99
  " width of the column used to indicate folds
  set foldcolumn=1
  " folding type: "manual", "indent", "expr", "marker" or "syntax"
  " syntax - syntax highlighting items specify folds.
  set foldmethod=syntax
endif

" ## 19 reading and writing files
" don't fixes missing end-of-line at end of text file
set nofixendofline

" automatically write a file when leaving a modified buffer
set autowrite
" automatically read a file when it was modified outside of Vim
set autoread

" encryption method for file writing
set cryptmethod=blowfish2

" ## 21 command line editing
" specifies how command line completion works
set wildmode=list:longest,full

" ## 23 running make and jumping to errors
if has('win32') && has('quickfix') && executable('tee')
  " string used to put the output of ":make" in the error file
  set shellpipe=2>&1\|\ tee
endif

" ## 25 language specific
if has('keymap')
  " name of a keyboard mapping
  if has('win32') || has('win32unix')
    set keymap=russian-jcukenwin
  elseif has('unix')
    set keymap=russian-jcuken
  elseif has('mac')
    set keymap=russian-jcukenmac
  endif
endif
" in Insert mode: 1: use :lmap; 2: use IM; 0: neither
set iminsert=0
" entering a search pattern: 1: use :lmap; 2: use IM; 0: neither
" -1 - as iminsert
set imsearch=-1

if has('langmap')
  " list of characters that are translated in Normal mode
  set langmap=№;#,
    \ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.,
    \ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
endif

" ## 27 various
" enable reading .vimrc/.exrc/.gvimrc in the current directory
set exrc
" safer working with script files in the current directory
set secure

if has('win32') && has('mksession')
  " directory where to store files with :mkview
  set viewdir=~/vimfiles/view
endif

" see all error messages and also throw an exception and set v:errmsg
set debug=throw


" # Add optional default packages
" the matchit plugin makes the % command work better,
" but it is not backwards compatible
packadd! matchit


" # Load extended config parts
runtime! vimrc.d/**/*.vim


" # Modeline
" vim:fdm=expr
" vim:fde={n->n>0?'>'.n\:'='}(len(matchstr(getline(v\:lnum),'\\s\\zs#\\+\\ze\\s')))
