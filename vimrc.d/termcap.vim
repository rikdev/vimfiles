if has('cursorshape')
  if &term =~ 'xterm'
    let &t_SI = "\<Esc>[5 q" "start insert mode (bar cursor shape)
    let &t_EI = "\<Esc>[2 q" "end insert or replace mode (block cursor shape)
  endif
endif
