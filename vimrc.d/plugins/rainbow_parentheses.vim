nnoremap <leader>r( :RainbowParenthesesToggle<cr>
nnoremap <leader>r) :RainbowParenthesesToggle<cr>

augroup rainbow_parentheses
  au!
  au VimEnter * RainbowParenthesesActivate
  au BufEnter * RainbowParenthesesLoadRound
  au BufEnter * RainbowParenthesesLoadSquare
  au BufEnter * RainbowParenthesesLoadBraces
augroup END
