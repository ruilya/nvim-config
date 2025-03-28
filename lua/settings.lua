vim.cmd.colorscheme('solarized')

vim.o.splitright = true
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.title = true
vim.o.hidden = true
vim.o.autowrite = true

vim.o.background = 'dark'
vim.o.keymap = 'russian-jcukenwin'
vim.o.fencs = 'utf8,cp1251'
vim.o.shiftwidth = 4
vim.o.iminsert = 0
vim.o.imsearch = -1
vim.o.colorcolumn = '80'
vim.o.mouse = 'a'
vim.o.textwidth = 80
vim.o.scrolloff = 5
vim.o.cinoptions = 'g-4'

vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'

vim.g.netrw_banner = '0'

vim.o.winborder = 'rounded'
