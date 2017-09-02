" # Encoding options
" character encoding used in Vim
set encoding=utf-8


" # Get the defaults that most users want
source $VIMRUNTIME/defaults.vim


" # Variables
if has('win32')
  let g:user_vimfiles='~/vimfiles'
else
  let g:user_vimfiles='~/.vim'
endif


" # Options
" ## important
" key sequence to toggle paste mode
set pastetoggle=<F12>


" ## moving around, searching and patterns
" list of flags specifying which commands wrap to another line
set whichwrap+=<,>,[,]

" ignore case when using a search pattern
set ignorecase
" override 'ignorecase' when pattern has upper case characters
set smartcase


" ## displaying text
" don't long lines wrap
set nowrap

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


" ## multiple windows
" 0, 1 or 2; when to use a status line for the last window
set laststatus=2
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


" ## editing text
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
" specifies how command line completion works
set wildmode=longest:list,full


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
" enable reading .vimrc/.exrc/.gvimrc in the current directory
set exrc
" safer working with script files in the current directory
set secure

" directory where to store files with :mkview
if has('win32')
  set viewdir=~/vimfiles/view
endif


" # Add optional default packages
" the matchit plugin makes the % command work better,
" but it is not backwards compatible
packadd matchit


" # Load extended config parts
runtime! vimrc.d/**/*.vim


" # Modeline
" vim:fdm=expr
" vim:fde={n->n>0?'>'.n\:'='}(len(matchstr(getline(v\:lnum),'\\s\\zs#\\+\\ze\\s')))
