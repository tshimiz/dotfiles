call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'thinca/vim-quickrun'

" Programming
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'andymass/vim-matchup'
Plug 'mattn/emmet-vim'

" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'

" JavaScript
Plug 'pangloss/vim-javascript'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Quramy/tsuquyomi'

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

" Phoenix
Plug 'avdgaag/vim-phoenix'
Plug 'tpope/vim-projectionist' " required for some navigation features

" Elm
Plug 'elmcast/elm-vim'

call plug#end()

syntax enable

" vi互換をオフ
set nocompatible

" 行番号を表示する
set number

set encoding=UTF-8
set path+=lib/**5
set laststatus=2

" Tab
set expandtab
set shiftwidth=2
set softtabstop=2

" Color
set t_Co=256
set background=dark
colorscheme solarized

" 補完
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Grep
autocmd QuickFixCmdPost *grep* cwindow

" Airline
let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" NERDTree
" vim起動時にNERDTreeを起動
autocmd VimEnter * NERDTree
" ファイルを指定して起動した場合はカーソルをファイル編集画面に移動
autocmd VimEnter * if argc() == 1 | wincmd p | endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Ale
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_open_list = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
set omnifunc=ale#completion#OmniFun

"elixir
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

