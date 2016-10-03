nnoremap <leader>r( :RainbowParenthesesToggle<cr>
nnoremap <leader>r) :RainbowParenthesesToggle<cr>

augroup rainbow_parentheses
  au VimEnter * RainbowParenthesesToggle
  au Syntax clojure RainbowParenthesesLoadRound
  au Syntax clojure RainbowParenthesesLoadSquare
  au Syntax clojure RainbowParenthesesLoadBraces
augroup END
