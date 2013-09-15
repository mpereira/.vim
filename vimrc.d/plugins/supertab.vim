let g:SuperTabClosePreviewOnPopupClose     = 1
let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'
let g:SuperTabContextTextOmniPrecedence    = ['&completefunc', '&omnifunc']
let g:SuperTabDefaultCompletionType        = 'context'
let g:SuperTabLongestEnhanced              = 1

imap <c-j> <Plug>SuperTabForward
imap <c-k> <Plug>SuperTabBackward
