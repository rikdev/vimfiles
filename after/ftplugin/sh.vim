if exists('b:did_user_after_ftplugin')
  finish
endif
let b:did_user_after_ftplugin = 1

" columns to highlight
setlocal colorcolumn+=80
" number of spaces used for each step of (auto)indent
setlocal shiftwidth=2
" expand <Tab> to spaces in Insert mode
setlocal expandtab
