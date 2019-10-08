

execute pathogen#infect()
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_ctags_extra_args = ['--fields=+ailmnS']

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

set laststatus=2

function LightlineTags()
    return '%{gutentags#statusline("[Generating\ tags...]")}'
endfunction


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ,
      \             [ 'gitbranch', 'readonly', 'modified', 'tags' ] ]
      \ },
      \ 'component_expand': {
      \   'tags': 'LightlineTags'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#statusline'
      \ },
      \ }

" fugitive bug
autocmd BufReadPre fugitive:///* set fencs=utf8

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END


syntax on
set background=dark
colorscheme NeoSolarized
set cursorcolumn
set nocompatible
set shiftwidth=4
set tabstop=4
set keymap=myrussian
"set keymap=russian
"loadkeymap russian-jcukenwin
set imi=0
set ims=0
set fencs=utf8,cp1251
set smarttab
set softtabstop=4
set expandtab
set hlsearch

set list
set listchars=tab:>-,trail:¬,nbsp:+,eol:<
set guioptions-=T
set guioptions-=r
set guioptions-=m
set history=10000
set wildmenu
set scrolloff=3
set co=80
set cursorline
set colorcolumn=80
set laststatus=2
set smartcase
set tagbsearch
set showcmd
set visualbell
set rnu
set undofile
set incsearch
set nomousehide
set showmatch
set ignorecase " <<< use with smartcase!!!
set smartcase  " <<< used only with ignoreacase!!
set guifont=Hack
set splitright
set ruler
match Ignore /\r$/
set cinoptions=N-s,t0,+s,(0

" Since Vim will source .vimrc from any directory you run Vim from, this is a
" potential security hole; so, you should consider setting secure option. This
" option will restrict usage of some commands in non-default .vimrc files;
" commands that write to file or execute shell commands are not allowed and
" map commands are displayed.
set exrc
set secure

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

"" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:netrw_list_hide= '.*\.swp$,\~$,\.orig$'

if has('nvim')
    "Guifont:h10
  "call plug#begin('~/.config/nvim/plugged')
  "Plug 'Shougo/deoplete.nvim' , { 'do': ':UpdateRemotePlugins' }
  ""Plug 'ludovicchabant/vim-gutentags'
  "call plug#end()
endif

set termguicolors
set mouse=v
set clipboard=unnamed

" highlight group
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" before the first colorscheme command will ensure that the highlight group
" gets created and is not cleared by future colorscheme commands.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" match trailing whitespace, except when typing at the end of a line
match ExtraWhitespace /\s\+\%#\@<!$/
" let the highlighting show up as soon as you leave insert mode after entering
" trailing whitespace
autocmd InsertLeave * redraw!
