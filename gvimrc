" # Options
" numbering as in :options
" ## 4 displaying text
" width of the display
set columns=9999 "widest window possible
" number of lines in the display
set lines=999 "tallest window possible

" ## 9 using the mouse
" mouse button is used for
set mousemodel=popup_setpos

" ## 10 GUI
if has('gui_win32')
  " list of font names to be used in the GUI
  set guifont=consolas:h11
  " options for text rendering
  set renderoptions=type:directx
endif

" list of flags that specify how the GUI works
" ! - external commands are executed in a terminal window
set guioptions+=!
