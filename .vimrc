call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimfiler.vim'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'thinca/vim-quickrun'

" Programming
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
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
Plug 'GrzegorzKozub/vim-elixirls', { 'do': ':ElixirLsCompileSync' }
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
set diffopt=filler,vertical
set laststatus=2

" Windows でもパスの区切り文字を / にする
set shellslash

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
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1

" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1

" Vimfiler
let g:vimfiler_as_default_explorer = 1
call vimfiler#custom#profile('default', 'context', {
  \ 'safe' : 0,
  \ 'edit_action' : 'tabopen',
  \ })

" NERDTree
" vim起動時にNERDTreeを起動
autocmd VimEnter * NERDTree
" ファイルを指定して起動した場合はカーソルをファイル編集画面に移動
autocmd VimEnter * if argc() == 1 | wincmd p | endif

" previm
let g:previm_show_header = 0

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Ale
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier-eslint'],
      \}
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_open_list = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_linters = {
      \ 'elixir':  [ 'credo', 'elixir-ls' ],
      \}

" Ale for Elixir
let s:user_dir = expand('~/.vim')
let g:ale_elixir_elixir_ls_release = s:user_dir . '/plugged/vim-elixirls/elixir-ls/release'
" https://github.com/JakeBecker/elixir-ls/issues/54
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }
autocmd FileType elixir,eelixir nnoremap <C-]> :ALEGoToDefinition<CR>
autocmd FileType elixir,eelixir nnoremap <C-\> :ALEFindReferences<CR>

" Elixir
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

