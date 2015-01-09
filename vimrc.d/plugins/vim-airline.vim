let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'

let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.paste = 'p'

let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'n',
  \ 'i'  : 'i',
  \ 'R'  : 'r',
  \ 'c'  : 'c',
  \ 'v'  : 'v',
  \ 'V'  : 'v',
  \ '' : 'v',
  \ 's'  : 's',
  \ 'S'  : 's',
  \ '' : 's',
\ }

function! FileEncodingAndFormat()
  return &fileformat != 'unix' && &fileencoding != 'utf8' ? 'ffenc' : ''
endf

function! AirlineInit()
  let g:airline_section_x = airline#section#create_right(['tagbar'])
  let g:airline_section_y = airline#section#create_right([FileEncodingAndFormat()])
  let g:airline_section_z = airline#section#create_right(['%l:%c %p%% %L'])
endf

autocmd VimEnter * call AirlineInit()

let g:airline#extensions#hunks#non_zero_only         = 1
let g:airline#extensions#branch#displayed_head_limit = 8
let g:airline#extensions#tabline#buffer_idx_mode     = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tabline#enabled       = 1
let g:airline#extensions#tabline#left_sep      = ''
let g:airline#extensions#tabline#left_alt_sep  = ''
let g:airline#extensions#tabline#right_sep     = ''
let g:airline#extensions#tabline#right_alt_sep = ''
