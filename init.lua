require('core/lazy')
require('plugins/lualine')
require('plugins/nvim-treesitter')
require('plugins/gitsigns')
require('plugins/mason')
require('plugins/mason-lspconfig')
require('plugins/lspconfig')
-- require('plugins/cmp')
require('settings')
require('autocommands')

vim.cmd([[
let g:nvim_conf = fnamemodify(expand("$MYVIMRC"), ":p:h")
let &runtimepath = &runtimepath . ',' . nvim_conf . '/bundle/vim-pathogen'

execute pathogen#infect()

autocmd BufRead,BufNewFile *.qbs set filetype=qbs

let g:go_doc_popup_window = 1

nnoremap <leader>jd :YcmCompleter GoTo<CR>

nnoremap m<Space> :make<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>gt <Plug>(go-test)

let g:clang_format#detect_style_file=1
let g:clang_format#enable_fallback_style=0
let g:clang_format#auto_format=1
autocmd FileType c,cpp,objc,proto nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc,proto vnoremap <buffer><Leader>cf :ClangFormat<CR>

command Vg vertical G

let g:clang_format#command = "clang-format"

let $GTEST_COLOR=0
let $GTEST_BRIEF=1

autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

augroup GTest
        autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
        autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
        autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
        autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
        autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
        autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
        autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
        autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
        autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
        autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END

"Toggle YouCompleteMe on and off with F3
function Toggle_ycm()
    if g:ycm_show_diagnostics_ui == 0
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui = 1
        :YcmRestartServer
        :e
        :echo "YCM on"
    elseif g:ycm_show_diagnostics_ui == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui = 0
        :YcmRestartServer
        :e
        :echo "YCM off"
    endif
endfunction
map <F3> :call Toggle_ycm() <CR>
]])
