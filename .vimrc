if has('nvim')
  let plugpath = (stdpath('data') . '/plugged')
else 
  let plugpath = '~/.vim/plugged'
endif 
call plug#begin(plugpath)

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
Plug 'mattn/vim-maketable'

" asciidoctor
Plug 'habamax/vim-asciidoctor'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vimspector
Plug 'puremourning/vimspector'

" lsp
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

" neosnippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" vim-vinegar
Plug 'tpope/vim-vinegar'

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

" .un~を作らない
set noundofile

" バックアップファイルを作らない
set nobackup
set writebackup

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

" bbye
nnoremap <Leader>q :Bdelete<CR>

" カーソル行をハイライト
set cursorline

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
hi Pmenu ctermfg=75 guifg=#61afef guibg=#585858
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

" ##### open-browser #####
nmap <Leader>o <Plug>(openbrowser-smart-search)
let g:openbrowser_default_search = 'duckduckgo'
let g:previm_plantuml_imageprefix = 'http://localhost:9999/plantuml/img'

" ##### plasticboy/vim-markdown #####
let g:vim_markdown_folding_disabled = 1

" ##### asciidoctor #####
let g:asciidoctor_extensions = ['asciidoctor-diagram']
let g:asciidoctor_pdf_extensions = ['asciidoctor-diagram', 'asciidoctor-pdf-cjk']
let g:asciidoctor_pdf_themes_path = '~/asciidoctor/resources/themes'
let g:asciidoctor_pdf_fonts_path = '~/asciidoctor/resources/fonts'
let g:asciidoctor_fenced_languages = ['python', 'c', 'javascript']

" generate an HTML file upon saving
augroup ON_ASCIIDOCTOR_SAVE | au!
    au BufWritePost *.adoc :Asciidoctor2HTML
augroup end

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
let g:airline_theme='onedark'
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

" ##### Elixir #####
let g:mix_format_on_save = 1
let g:mix_format_options = '--check-equivalent'

" ##### Clang #####
let g:clang_cpp_options = '-std=c++14 -Wall -I/usr/local/include/c++/9.1.0/ -I/usr/local/include/c++/9.1.0/x86_64-apple-darwin18/'

" ##### netrw #####
let g:netrw_liststyle = 3
nnoremap <silent> <space>e :<C-u>Explore<cr>

" ##### fzf #####
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <silent> <space>f :<C-u>Files<cr>
nnoremap <silent> <space>m :<C-u>History<cr>
nnoremap <silent> <space>g :<C-u>GFiles<cr>
nnoremap <silent> <space>G :<C-u>GFiles?<cr>
nnoremap <silent> <space>r :<C-u>Rg<cr>

" ##### fugitive #####
nnoremap <silent> <leader>gs :<C-u>Gstatus<cr>
" stageのdiff
command Greview :Git! diff --staged
nnoremap <silent> <leader>gr :<C-u>Greview<cr>
