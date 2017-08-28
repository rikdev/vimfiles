" load color scheme
colorscheme desert
" customize color scheme
highlight ColorColumn ctermbg=DarkGray guibg=#404040
highlight CursorLine cterm=NONE ctermfg=NONE guibg=NONE
highlight SpellBad ctermfg=DarkRed ctermbg=Black
highlight SpellCap ctermfg=DarkRed ctermbg=Black
highlight SpecialKey ctermfg=DarkGray

" colors for statusline options indicators
" User1 - option on color
" User2 - option off color
highlight User1 cterm=bold,reverse gui=NONE guifg=Black guibg=#c2bfa5
highlight User2 cterm=bold,reverse gui=NONE guifg=DarkGray guibg=#c2bfa5
if &term ==? 'win32'
  highlight User2 ctermfg=DarkGray
else
  highlight User2 ctermbg=Gray
endif
