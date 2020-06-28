call plug#begin(stdpath('data') . '/plugged')

" colorscheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'

Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'thinca/vim-quickrun'

Plug 'previm/previm'
Plug 'tyru/open-browser.vim'

"delete buffers (close files) without closing your windows or messing up your layout.
Plug 'moll/vim-bbye'

Plug 'Lokaltog/vim-easymotion'

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" vimspector
Plug 'puremourning/vimspector'

" lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " denite
  Plug 'Shougo/denite.nvim'
  " defx
  Plug 'Shougo/defx.nvim'
  " for denite and defx
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" defx
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" neoyank
Plug 'Shougo/neoyank.vim'

" neomru
Plug 'Shougo/neomru.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" comment
Plug 'tomtom/tcomment_vim'

" wisely add "end" in ruby, endfunction/endif/more in vim script
" Plug 'tpope/vim-endwise'

" highlight, navigate, and operate on sets of matching text.
Plug 'andymass/vim-matchup'

Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" Phoenix
Plug 'avdgaag/vim-phoenix'

" Elm
Plug 'elmcast/elm-vim'

call plug#end()

syntax enable

" vi互換をオフ
set nocompatible

"ビープ音を消す
set belloff=all

" 行番号を表示する
set number
"
" インクリメンタルサーチ
" set incsearch

" カーソル行をハイライト
set cursorline

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

let mapleader = ";"

" jjでESC
inoremap <silent> jj <ESC>

" カーソル行をハイライト
set cursorline

" カーソルの形状を変える(iTerm2)
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

" ##### Color #####
set t_Co=256
set background=dark
"  colorscheme solarized
colorscheme onehalfdark
" colorscheme hybrid
" ヴィジュアルモードでの選択範囲の色
hi Visual ctermbg=66 guibg=#5F8787
" カーソル行の色
 hi CursorLine ctermfg=187 ctermbg=234 guifg=#d7d7af guibg=#293739
" Diffの色
hi DiffText ctermfg=75 guifg=#61afef guibg=#585858
" ポップアップメニューの色
" hi Pmenu ctermfg=75 guifg=#61afef guibg=#585858
  " hi Pmenu ctermfg=75 ctermbg=238 guifg=#5fafff guibg=#444444
  " hi PmenuSel ctermfg=178 ctermbg=238 guifg=#d7af00 guibg=#444444
" LSPのHintTextの色
 hi LspHintText ctermfg=15 ctermbg=114 guifg=#5f5f00 guibg=#98c379

if has('nvim')
  set termguicolors
  " ポップアップメニュを透過
  " set pumblend=10
endif

" ##### neosnippet ######
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" ##### asyncomplete ####
" 補完表示時のEnterで改行をしない
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
if !has('nvim')
  " allow modifying the completeopt variable, or it will
  " be overridden all the time
  let g:asyncomplete_auto_completeopt = 0
  set completeopt=menuone,noinsert,noselect,popup
end

" ##### lsp ####
" 補完表示時のEnterで改行をしない
nmap <silent> gd <Plug>(lsp-definition)
nmap <silent> gy <Plug>(lsp-type-definition)
nmap <silent> gi <Plug>(lsp-implementation)
nmap <silent> gr <Plug>(lsp-references)
nmap <silent> [g <plug>(lsp-previous-diagnostic)
nmap <silent> ]g <plug>(lsp-next-diagnostic)
nmap <silent> K <plug>(lsp-hover)
nmap <Leader>rn <Plug>(lsp-rename)

let g:lsp_diagnostics_enabled = 1

" ##### vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" ##### open-browser
nmap <Leader>o <Plug>(openbrowser-smart-search)
let g:openbrowser_default_search = 'duckduckgo'
let g:previm_plantuml_imageprefix = 'http://localhost:9999/plantuml/img'

" ##### plasticboy/vim-markdown #####
let g:vim_markdown_folding_disabled = 1

" ##### EasyMotion #####
let mapleader = ";"
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" hjkl motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" ターゲットが1つしかない場合は自動移動
map f <Plug>(easymotion-fl)
map t <Plug>(easymotion-tl)
map F <Plug>(easymotion-Fl)
map T <Plug>(easymotion-Tl)

" vimgrepの結果をquickfix-windowで一覧表示
autocmd QuickFixCmdPost *grep* cwindow

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline_theme='hybrid'
let g:airline_powerline_fonts = 1

" previm
let g:previm_show_header = 0

" ##### Ale #####
nmap <silent> <Leader>f <plug>(ale_fix)
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines'],
  \ 'cpp': ['gcc'],
  \ 'css': ['prettier'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'python': ['autopep8', 'isort', 'trim_whitespace'],
  \ 'typescript': ['prettier', 'eslint'],
  \}
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '=='
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_open_list = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_linters = {
      \ 'cpp': ['gcc'],
      \ 'elixir':  [ 'credo', 'elixir-ls' ],
      \ 'jsx': ['stylelint', 'eslint'],
      \ 'typescript': ['eslint'],
      \}

" Ale for Clang
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  let g:ale_cpp_gcc_options = '-std=c++14 -Wall -I/usr/local/include/c++/9.3.0/ -I/usr/local/include/c++/9.3.0/x86_64-apple-darwin18/'
  let g:ale_cpp_clang_options = '-std=c++14 -Wall -I/usr/local/include/c++/9.3.0/ -I/usr/local/include/c++/9.3.0/x86_64-apple-darwin18/'
endif

" Ale for Elixir
let s:user_dir = expand('~/.vim')
let g:ale_elixir_elixir_ls_release = s:user_dir . '/plugged/vim-elixirls/elixir-ls/release'
" https://github.com/JakeBecker/elixir-ls/issues/54
let g:ale_elixir_elixir_ls_config = { 'elixirLS': { 'dialyzerEnabled': v:false } }
autocmd FileType elixir,eelixir nnoremap <C-]> :ALEGoToDefinition<CR>
autocmd FileType elixir,eelixir nnoremap <C-\> :ALEFindReferences<CR>

" ##### Elixir #####
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

" ##### Clang #####
let g:clang_cpp_options = '-std=c++14 -Wall -I/usr/local/include/c++/9.1.0/ -I/usr/local/include/c++/9.1.0/x86_64-apple-darwin18/'

" ##### denite #####
nnoremap <silent> <space>d :<C-u>Denite menu -split=floating<cr>
nnoremap <silent> <space>b :<C-u>Denite buffer -split=floating<cr>
nnoremap <silent> <space>f :<C-u>Denite file -split=floating<cr>
nnoremap <silent> <space>m :<C-u>Denite file_mru -split=floating<cr>
nnoremap <silent> <space>y :<C-u>Denite neoyank -split=floating<cr>
nnoremap <silent> <space>g :<C-u>Denite grep -split=floating<cr>
nnoremap <silent> <space>w :<C-u>DeniteCursorWord grep -split=floating<cr>

" Denite mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <ESC>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> h 
  \ denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> <BS>
  \ denite#do_map('restore_sources')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Add custom menus
let s:menus = {}

let s:menus.vim = {
  \ 'description': 'vim'
  \ }
let s:menus.vim.file_candidates = [
  \ ['init.vim', '~/.config/nvim/init.vim'],
  \ ]

let s:menus.my_commands = {
  \ 'description': 'Commands'
  \ }
let s:menus.my_commands.command_candidates = [
  \ ['hitest', 'so $VIMRUNTIME/syntax/hitest.vim'],
  \ ]

call denite#custom#var('menu', 'menus', s:menus)


call denite#custom#var('file/rec', 'command',
  \ ['rg', '--files', '--glob', '!.git'])

" Ripgrep command on grep source
call denite#custom#var('grep', {
  \ 'command': ['rg'],
  \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': ['--regexp'],
  \ 'separator': ['--'],
  \ 'final_opts': [],
  \ })

" ##### defx #####
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call s:defx_open() | endif

function! s:defx_open() abort
  Defx -columns=git:mark:indent:icons:filename:type
  \ -split=vertical -winwidth=30 -direction=topleft
endfunction

nnoremap <silent> <space>e
  \ :<C-u>Defx -columns=git:mark:indent:icons:filename:type
  \ -split=vertical -winwidth=30 -direction=topleft<cr>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \  'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction
