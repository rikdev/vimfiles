" # Variables
if has('win32')
  let g:user_vimfiles='~/vimfiles'
else
  let g:user_vimfiles='~/.vim'
endif


" # Options
" ## multi-byte characters
" character encoding used in Vim
set encoding=utf-8


" ## important
" key sequence to toggle paste mode
set pastetoggle=<F12>


" ## moving around, searching and patterns
" list of flags specifying which commands wrap to another line
set whichwrap+=<,>,[,]

" show match for partly typed search command
set incsearch
" ignore case when using a search pattern
set ignorecase
" override 'ignorecase' when pattern has upper case characters
set smartcase


" ## displaying text
" don't long lines wrap
set nowrap
" change the way text is displayed
" "truncate" to show the last line even if it doesn't fit
set display+=truncate

" don't redraw while executing macros
set lazyredraw

" show whitespace chars
set list
" list of strings used for list mode
set listchars=tab:→\ ,space:·,trail:·,extends:»,precedes:«,conceal:˽,nbsp:◦

" show the line number for each line
set number
" show the relative line number for each line
set relativenumber


" ## syntax, highlighting and spelling
" enable syntax highlighting
syntax enable
" highlight all matches for the last used search pattern
set hlsearch
" highlight the screen line of the cursor
if &term !=? 'cygwin'
  set cursorline
endif

" list of accepted languages
set spelllang+=ru
" file that "zg" adds good words to
let &spellfile=g:user_vimfiles . 'spell/user.utf-8.add'


" ## using the mouse
" list of flags for using the mouse
set mouse=a


" ## messages and info
" show (partial) command keys in the status line
set showcmd
" show cursor position below each window
set ruler


" ## editing text
" specifies what <BS>, CTRL-W, etc. can do in Insert mode
set backspace+=indent,eol,start

" list of flags that tell how automatic formatting works
" j to where it makes sense, remove a comment leader when joining lines
set formatoptions+=j

" list of dictionary files for keyword completion
set dictionary+=/usr/share/dict/words

" don't use two spaces after '.' when joining a line
set nojoinspaces


" ## tabs and indenting
" number of spaces a <Tab> in the text stands for
set tabstop=4
" number of spaces used for each step of (auto)indent
set shiftwidth=4
" a <Tab> in an indent inserts 'shiftwidth' spaces
set smarttab

" automatically set the indent of a new line
set autoindent
" do clever autoindenting
set smartindent


" ## folding
" value for 'foldlevel' when starting to edit a file
set foldlevelstart=99
" width of the column used to indicate folds
set foldcolumn=1
" folding type: "manual", "indent", "expr", "marker" or "syntax"
set foldmethod=syntax


" ## reading and writing files
" don't fixes missing end-of-line at end of text file
set nofixendofline

" automatically write a file when leaving a modified buffer
set autowrite
" automatically read a file when it was modified outside of Vim
set autoread


" ## command line editing
" how many command lines are remembered
set history=200

" specifies how command line completion works
set wildmode=longest:list,full
" command-line completion shows a list of matches
set wildmenu


" ## running make and jumping to errors
if has('win32') && executable('tee')
  " string used to put the output of ":make" in the error file
  set shellpipe=2>&1\|\ tee
endif


" ## language specific
" name of a keyboard mapping
if has('win32') || has('win32unix')
  set keymap=russian-jcukenwin
elseif has('unix')
  set keymap=russian-jcuken
elseif has('mac')
  set keymap=russian-jcukenmac
endif
" in Insert mode: 1: use :lmap; 2: use IM; 0: neither
set iminsert=0
" entering a search pattern: 1: use :lmap; 2: use IM; 0: neither;
" -1: as iminsert
set imsearch=-1

" list of characters that are translated in Normal mode
set langmap=№;#,
	\ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.,
	\ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>

" ## various
" enable file type detection
filetype plugin indent on

" enable reading .vimrc/.exrc/.gvimrc in the current directory
set exrc
" safer working with script files in the current directory
set secure

" directory where to store files with :mkview
if has('win32')
  set viewdir=~/vimfiles/view
endif


" # Load extended config parts
runtime! vimrc.d/**/*.vim


" # Modeline
" vim:fdm=expr
" vim:fde={n->n>0?'>'.n\:'='}(len(matchstr(getline(v\:lnum),'\\s\\zs#\\+\\ze\\s')))
