if exists('b:did_user_after_ftplugin')
  finish
endif
let b:did_user_after_ftplugin = 1

if &filetype == 'cpp'
  " list of pairs that match for the "%" command
  setlocal matchpairs+=<:>
endif
