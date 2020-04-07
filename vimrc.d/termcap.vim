if has('cursorshape')
  if &term =~ 'screen\.xterm'
    let &t_SI = "\eP\e[5 q\e\\" "start insert mode (bar cursor shape)
    let &t_EI = "\eP\e[2 q\e\\" "end insert or replace mode (block cursor shape)
  elseif &term =~ 'xterm'
    let &t_SI = "\<Esc>[5 q" "start insert mode (bar cursor shape)
    let &t_EI = "\<Esc>[2 q" "end insert or replace mode (block cursor shape)
  endif
endif
