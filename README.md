# vimfiles

## Dependencies
  - ack
  - ctags
  - git
  - ruby
  - vim compiled with ruby support

## Installation
    $ git clone git://github.com/mpereira/vimfiles ~/.vim
    $ cd ~/.vim
    $ make install_git_modules
    $ echo "source ~/.vim/vimrc" > ~/.vimrc

#### vim-ruby
vim-ruby requires vim compiled with ruby support. To check if your current vim
installation has ruby support, type:

    $ vim --version | grep ruby

If the output contains `+ruby` you're good to go. If not, you must compile vim
with ruby support.

    $ wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
    $ tar xvfj vim-7.3.tar.bz2
    $ cd vim73
    $ ./configure --enable-rubyinterp
    $ make && sudo make install

#### Gist.vim
  To make Gist.vim work you need to set your github token in ~/.gitconfig.

## Plugins Used
  - [CSApprox](https://github.com/vim-scripts/CSApprox)
  - [Gist.vim](https://github.com/vim-scripts/Gist.vim)
  - [MatchTag](https://github.com/gregsexton/MatchTag)
  - [a.vim](https://github.com/vim-scripts/a.vim)
  - [ack.vim](https://github.com/mileszs/ack.vim)
  - [bufexplorer.zip](https://github.com/vim-scripts/bufexplorer.zip)
  - [c.vim](https://github.com/vim-scripts/c.vim)
  - [camelcasemotion](https://github.com/vim-scripts/camelcasemotion)
  - [ctrlp.vim](https://github.com/kien/ctrlp.vim)
  - [gitv](https://github.com/vim-scripts/gitv)
  - [ledger.vim](https://github.com/vim-scripts/ledger.vim)
  - [ledger.vim-indent](https://github.com/vim-scripts/ledger.vim-indent)
  - [matchit.zip](https://github.com/vim-scripts/matchit.zip)
  - [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
  - [nerdtree](https://github.com/scrooloose/nerdtree)
  - [snipmate.vim](https://github.com/msanders/snipmate.vim)
  - [syntastic](https://github.com/scrooloose/syntastic)
  - [tlib_vim](https://github.com/tomtom/tlib_vim)
  - [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils)
  - [vim-autoclose](https://github.com/Townk/vim-autoclose)
  - [vim-cucumber](https://github.com/tpope/vim-cucumber)
  - [vim-easytags](https://github.com/xolox/vim-easytags)
  - [vim-fugitive](https://github.com/tpope/vim-fugitive)
  - [vim-javascript](https://github.com/pangloss/vim-javascript.git)
  - [vim-jst](https://github.com/briancollins/vim-jst.git)
  - [vim-less](https://github.com/lunaru/vim-less)
  - [vim-markdown](https://github.com/plasticboy/vim-markdown)
  - [vim-pathogen](https://github.com/tpope/vim-pathogen)
  - [vim-powerline](https://github.com/Lokaltog/vim-powerline)
  - [vim-ragtag](https://github.com/tpope/vim-ragtag)
  - [vim-rails](https://github.com/tpope/vim-rails)
  - [vim-rake](https://github.com/tpope/vim-rake)
  - [vim-repeat](https://github.com/tpope/vim-repeat)
  - [vim-ruby](https://github.com/vim-ruby/vim-ruby)
  - [vim-snipmate](https://github.com/garbas/vim-snipmate)
  - [vim-surround](https://github.com/tpope/vim-surround)
  - [vimerl](https://github.com/jimenezrick/vimerl)
  - [webapi-vim](https://github.com/mattn/webapi-vim)

## Colorscheme:
  [jellybeans](https://github.com/vim-scripts/jellybeans.vim)

## Author
  [Murilo Pereira](http://murilopereira.com)
