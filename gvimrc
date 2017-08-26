" # Options
" ## displaying text
" width of the display (widest window possible)
set columns=9999
" number of lines in the display (tallest window possible)
set lines=999

" ## GUI
if has('win32')
  " list of font names to be used in the GUI
  set guifont=consolas:h11
  " options for text rendering
  set renderoptions=type:directx
endif

" list of flags that specify how the GUI works
set guioptions+=c "don't use popup dialogs for simple choices
set guioptions-=m "don't menu bar is present
set guioptions-=T "don't include Toolbar
set guioptions-=r "don't right-hand scrollbar is always present
set guioptions-=L "left-hand scrollbar is present
