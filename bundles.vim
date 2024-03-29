set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"------------------
" Code Completions
"------------------
Plugin 'ycm-core/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
""Plugin 'Shougo/neocomplcache'
""Plugin 'mattn/emmet-vim'
""Plugin 'Raimondi/delimitMate'
""Plugin 'ervandew/supertab'
" snippets
""Plugin 'garbas/vim-snipmate'
""Plugin 'honza/vim-snippets'
"------ snipmate dependencies -------
""Plugin 'MarcWeber/vim-addon-mw-utils'
""Plugin 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
""Plugin 'edsono/vim-matchit'
""Plugin 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
""Plugin 'tpope/vim-surround'
""Plugin 'scrooloose/nerdcommenter'
""Plugin 'sjl/gundo.vim'
""Plugin 'godlygeek/tabular'
""Plugin 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
""Plugin 'scrooloose/nerdtree'
"Plugin 'humiaozuzu/TabBar'
""Plugin 'majutsushi/tagbar'
""Plugin 'mileszs/ack.vim'
""Plugin 'kien/ctrlp.vim'
""Plugin 'tpope/vim-fugitive'
""Plugin 'Lokaltog/vim-powerline'
""Plugin 'scrooloose/syntastic'
""Plugin 'bronson/vim-trailing-whitespace'
"cscope
""Plugin 'simplyzhao/cscope_maps.vim'

"-------------
" Other Utils
"-------------
" Plugin 'humiaozuzu/fcitx-status'
""Plugin 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
"Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'tpope/vim-rails'
"Plugin 'lepture/vim-jinja'
"Plugin 'digitaltoad/vim-jade'

"------- web frontend ----------
""Plugin 'othree/html5.vim'
" Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
""P""lugin 'kchmck/vim-coffee-script'
""Plugin 'nono/jquery.vim'
" Plugin 'groenewege/vim-less'
" Plugin 'wavded/vim-stylus'
" Plugin 'nono/vim-handlebars'

"------- markup language -------
Plugin 'tpope/vim-markdown'
" Plugin 'timcharper/textile.vim'

"------- Ruby --------
" Plugin 'tpope/vim-endwise'

"------- Go ----------
""Plugin 'jnwhiteh/vim-golang'

"------- Kotlin ------
Plugin 'udalov/kotlin-vim'

"------- FPs ------
Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'wlangstroth/vim-racket'
" Plugin 'vim-scripts/VimClojure'
" Plugin 'rosstimson/scala-vim-support'

"--------------
" Color Schemes
"--------------
Plugin 'rickharris/vim-blackboard'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'rickharris/vim-monokai'
"Plugin 'tpope/vim-vividchalk'
"Plugin 'Lokaltog/vim-distinguished'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'fisadev/fisa-vim-colorscheme'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
