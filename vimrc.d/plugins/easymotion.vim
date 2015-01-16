let g:EasyMotion_keys       = 'asdfghjkl;'
let g:EasyMotion_do_mapping = 0

map <Leader> <Plug>(easymotion-prefix)

map <Leader>mc <Plug>(easymotion-s)
map <Leader>mf <Plug>(easymotion-f)
map <Leader>m2c <Plug>(easymotion-s2)
map <Leader>mw <Plug>(easymotion-w)
map <Leader>mW <Plug>(easymotion-W)

map  <Leader>/ <Plug>(easymotion-sn)
omap <Leader>/ <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion. Without these mappings, `n` & `N` works fine. (These mappings
" just provide different highlight method and have some other features)
" map n <Plug>(easymotion-next)
" map N <Plug>(easymotion-prev)
