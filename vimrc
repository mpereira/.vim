if exists('g:loaded_vimrc') || &compatible
  finish
else
  let g:loaded_vimrc = 1
endif

let g:mapleader = ','
let g:maplocalleader = ','

let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'eclim')
call add(g:pathogen_disabled, 'floobits-vim')
call add(g:pathogen_disabled, 'VimJSXHint')

runtime bundle/vim-pathogen/autoload/pathogen.vim
runtime bundle/hindent/vim/hindent.vim
call pathogen#infect()

runtime! vimrc.d/**/*.vim

filetype plugin indent on " Enable filetype detection, filetype-specific
                          " indenting and filetype-specific plugins.

set nocompatible          " disable vi compatibility

set modelines=0           " disable modelines (prevents a security exploit)

set encoding=utf-8

set ignorecase            " makes search case-insensitive
set smartcase             " unless it contains uppercase characters
set incsearch             " show pattern while typing
set hlsearch              " highlight search results

set tabstop=2             " tab width is 2 spaces
set softtabstop=2         " counts 2 spaces when delete or backspace is used
set shiftwidth=2          " indent with 2 spaces
set expandtab             " expand tabs to spaces

set textwidth=80          " 80 column lines.
set colorcolumn=+1
set synmaxcol=2048        " Prevent large file syntax highlighting slowdown.

set smartindent           " use intelligent indentation
set autoindent            " use indentation of previous line
set copyindent            " use existing indents for new indents
set shiftround            " always round indents to multiple of shiftwidth

set nojoinspaces          " never join lines with two spaces"

set foldmethod=syntax     " fold based on syntax
set foldlevelstart=0
set foldnestmax=3         " deepest fold is 3 levels
set nofoldenable          " dont fold by default

set complete-=i           " exclude include files
set complete-=t           " exclude tags
set complete-=u           " exclude unloaded buffers
set completeopt=menuone,longest,preview

set clipboard=unnamed     " Yanked values are piped to the X window clipboard.
set number                " show line numbers
set ruler                 " show the cursor position all the time
set showcmd               " display incomplete commands
set showmatch             " Highlight matching characters. e.g. {}, [], (), etc.
set wrap                  " wrap lines automatically
set ttyfast               " tell vim that our terminal is fast
set novisualbell          " don't blink
set noerrorbells          " no noise
set cursorline            " highlights the line where the cursor is at
set scrolloff=3           " minimal number of lines above and below the cursor
set nowritebackup         " don't save backup files
set autowrite             " flush external changes on open files
set laststatus=2          " show status line
set noshowmode            " Powerline already shows the mode
set hidden                " don't lose undo history when changing buffers
set lazyredraw            " do not redraw while running macros
set noswapfile            " no swap file
set undofile              " persistent undo history
set undodir=~/.vim/tmp    " don't save undo files locally
set tags=./tags;          " search for a tags file upward, starting from the
                          " directory of the current file.

" Display tabs and trailing spaces.
set list
set listchars=tab:»⋅,trail:⋅,nbsp:⋅

set wildmenu              " C-n and C-p scroll through matches
set wildchar=<TAB>        " start wild expansion in the command line using <TAB>
set wildmode=list:longest " tab completion

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Image files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
set wildignore+=*.spl                            " Compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.beam                           " Erlang byte code
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.class                          " Java byte code
set wildignore+=target                           " Clojure/Leiningen
set wildignore+=.vimtags
set wildignore+=bundle
set wildignore+=node_modules
set wildignore+=bower_components
set wildignore+=.stack-work
set wildignore+=.vagrant

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Store lots of :cmdline history.
set history=1000

" Some stuff to get the mouse going in term.
set mouse=a
if !has('nvim')
  set ttymouse=xterm2
endif

" When you're pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. Source:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=500
  augroup END
endif

" Display settings.
set t_Co=256
syntax on
set background=dark " assume a dark background
colorscheme jellybeans
highlight ColorColumn ctermbg=darkgray guibg=darkgray
hi Normal ctermbg=none

au BufRead,BufNewFile *.escript       set filetype=erlang
au BufRead,BufNewFile *gvimrc         set filetype=vim
au BufRead,BufNewFile *pentadactylrc  set filetype=vim
au BufRead,BufNewFile .rvmrc          set filetype=sh
au BufRead,BufNewFile *.jsx.erb       setlocal filetype=javascript

" Save file as root.
command! -bar -nargs=0 W silent! exec "write !sudo tee % >/dev/null" | silent! edit!

" Sample viminfo for projects.
" set viminfo=<10,%,'50,/100,:1000,@1000,f0,n~/path/to/project/.viminfo

" Replacement for vim-projectlocal not handling 'viminfo' commands in project
" local vimrcs.
let project_vimrc_path = getcwd() . '/.vimrc'
if filereadable(project_vimrc_path)
  execute 'source ' . project_vimrc_path
endif

" Jump to last cursor position when opening a file. Don't do it when writing a
" commit log entry.
au BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

" Toggle spell check when entering/leaving insert mode.
autocmd InsertEnter * setlocal spell
autocmd InsertLeave * setlocal nospell

" c Autowrap comments to textwidth.
" r Autoinsert comment leader with <Enter>.
" q Allow formatting of comments with :gq.
" l Don't format already long lines.
" n Recognize numbered lists.
" 1 Don't break a line after a 1-letter word.
" j Delete comment character when joining commented lines.
set formatoptions=crqln1j

" Load matchit.vim, but only if we haven't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
