let g:nvim_conf = fnamemodify(expand("$MYVIMRC"), ":p:h")
let &runtimepath = &runtimepath . ',' . nvim_conf . '/bundle/vim-pathogen'

execute pathogen#infect()
syntax on
filetype plugin indent on
set fencs=utf8,cp1251

let g:airline#extensions#xkblayout#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert=1
let g:airline#extensions#keymap#enabled = 0

set termguicolors
colorscheme NeoSolarized
set background=dark

set shiftwidth=4
set expandtab

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

au BufRead,BufNewFile *.qbs set filetype=qbs

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.hpp,*.cpp,*.cxx set filetype=cpp.doxygen
augroup END

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=-1

set undofile
set ignorecase
set smartcase
set colorcolumn=80
set cursorcolumn
set cursorline

set list
set listchars=tab:>-,trail:¬,nbsp:+

"" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set title

set mouse=a

nnoremap <leader>jd :YcmCompleter GoTo<CR>

"let g:ycm_clangd_binary_path = "/usr/bin/clangd-10"
let g:ycm_clangd_binary_path = "/usr/bin/clangd-9"
" let g:ycm_clangd_binary_path = "/usr/bin/clangd-8"
" let g:ycm_log_level = 'debug'

set hidden
set textwidth=80

let g:cmake_compile_commands = 1
let g:cmake_project_generator = "Ninja"
let g:cmake_usr_args = "-C ~/.cmake_defs.cmake"

nnoremap m<Space> :make<CR>

set scrolloff=5

let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
autocmd FileType c,cpp,objc,proto nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,proto vnoremap <buffer><Leader>cf :ClangFormat<CR>

command Vg vertical G

set cinoptions=g-4

set autowrite

let g:clang_format#command = "clang-format-10"

let g:gitgutter_max_signs = 1500
