let g:nvim_conf = fnamemodify(expand("$MYVIMRC"), ":p:h")
let &runtimepath = &runtimepath . ',' . nvim_conf . '/bundle/vim-pathogen'
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_global_ycm_extra_conf = nvim_conf . '/ycm_extra_conf.py'
let g:ycm_warning_symbol = 'WW'
set encoding=utf8
scriptencoding utf-8

let g:pathogen_disabled = []
"if !has('unix')
call add(g:pathogen_disabled, 'vim-gutentags')
call add(g:pathogen_disabled, 'gutentags_plus')
"endif

execute pathogen#infect()

set laststatus=2

let g:lightline = {
        \ 'component': {
        \   'lineinfo': ' %3l:%-2v',
        \ },
        \ 'component_function': {
        \   'readonly': 'LightlineReadonly',
        \   'gitbranch': 'LightlineFugitive'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'gitbranch', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" fugitive bug
autocmd BufReadPre fugitive:///* set fencs=utf8

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
set listchars=tab:>-,trail:¬,nbsp:+
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
endif

set termguicolors
set mouse=v
set clipboard=unnamed

set makeprg=ninja
set autoread
autocmd FocusGained * :checktime
set title

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.hpp,*.cpp,*.cxx set filetype=cpp.doxygen
augroup END

let &path.="/usr/include/x86_64-linux-gnu/"
