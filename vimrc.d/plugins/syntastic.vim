let g:syntastic_aggregate_errors         = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'

" let g:syntastic_clojure_checkers    = ['eastwood']
" let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_checkers = ['']

let g:syntastic_html_tidy_ignore_errors = [
  \"trimming empty <i>",
  \"trimming empty <span>",
  \"<input> proprietary attribute \"autocomplete\"",
  \"proprietary attribute \"role\"",
  \"proprietary attribute \"hidden\"",
  \"'<' + '/' + letter not allowed here",
\]
