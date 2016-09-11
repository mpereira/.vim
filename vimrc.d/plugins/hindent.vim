if has('autocmd')
  autocmd FileType purescript setlocal formatexpr=FormatHaskell()
endif
