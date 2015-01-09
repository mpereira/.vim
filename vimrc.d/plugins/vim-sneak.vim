" nmap N <Plug>SneakPrevious
" nmap n <Plug>SneakNext
nmap <expr> n sneak#is_sneaking() ? '<Plug>SneakNext' : 'n'
nmap <expr> N sneak#is_sneaking() ? '<Plug>SneakPrevious' : 'N'

nmap <leader>f <Plug>Sneak_s
nmap <leader>F <Plug>Sneak_S
xmap <leader>f <Plug>Sneak_s
xmap <leader>F <Plug>Sneak_S
omap <leader>f <Plug>Sneak_s
omap <leader>F <Plug>Sneak_S
