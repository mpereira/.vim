let g:SuperTabDefaultCompletionType        = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-x><c-u>'
let g:SuperTabLongestEnhanced              = 1
let g:SuperTabClosePreviewOnPopupClose     = 1
let g:SuperTabCompletionContexts           = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence    = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery     = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

imap <c-j> <Plug>SuperTabForward
imap <c-k> <Plug>SuperTabBackward
