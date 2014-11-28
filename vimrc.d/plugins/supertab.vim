let g:SuperTabDefaultCompletionType    = 'context'
let g:SuperTabClosePreviewOnPopupClose = 1

" Setting these seems to fuck up omnicompletion on Clojure namespaces and file
" path completion. Pressing <tab> after a namespace shows "Pattern not found" and
" a literal tab is inserted.
" let g:SuperTabMappingForward = '<c-j>'
" let g:SuperTabMappingBackward = '<c-k>'
