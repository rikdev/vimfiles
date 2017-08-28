function! s:MakeOptionIndicator(option, text)
  return " %1*%{&".a:option."?'".a:text."':''}%*"
	\."%2*%{&".a:option."?'':'".a:text."'}%*"
endfunction

" options indicators section
set statusline+=\ \|

" clear the highlighting for the 'hlsearch' option
nnoremap <silent> <unique> <leader>h :nohlsearch<CR>

" toggle spell option
nnoremap <silent> <unique> <F9> :set invspell<CR>
inoremap <silent> <unique> <F9> <Esc>:set invspell<CR>a
let &statusline.=s:MakeOptionIndicator('spell', 'Spell')

" toggle relativenumber option
nnoremap <silent> <unique> <F10> :set invrelativenumber<CR>
inoremap <silent> <unique> <F10> <Esc>:set invrelativenumber<CR>a
let &statusline.=s:MakeOptionIndicator('relativenumber', 'RNum')

" toggle list option
nnoremap <silent> <unique> <F11> :set invlist<CR>
inoremap <silent> <unique> <F11> <Esc>:set invlist<CR>a
let &statusline.=s:MakeOptionIndicator('list', 'List')

let &statusline.=s:MakeOptionIndicator('paste', 'Paste')

" map alt-movement keys to move cursor in insert mode (emacs style)
noremap <unique> <A-k> <Up>
noremap! <unique> <A-k> <Up>
noremap <unique> <A-j> <Down>
noremap! <unique> <A-j> <Down>
noremap <unique> <A-h> <Left>
noremap! <unique> <A-h> <Left>
noremap <unique> <A-l> <Right>
noremap! <unique> <A-l> <Right>
