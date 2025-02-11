require('core/lazy')
require('core/keymaps')
require('plugins/lspconfig')
require('plugins/lualine')
require('plugins/nvim-treesitter')
require('plugins/gitsigns')
require('plugins/toggleterm')
require('plugins/go-nvim')
require('plugins/cmp')
require('plugins/lspkind')
require('plugins/navbuddy')
require('plugins/telescope')
require('plugins/treesitter-context')
require('plugins/git-blame-nvim')
require('settings')

vim.cmd([[
let g:nvim_conf = fnamemodify(expand("$MYVIMRC"), ":p:h")

autocmd BufRead,BufNewFile *.qbs set filetype=qbs

nnoremap m<Space> :make<CR>

command Vg vertical G

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
]])
