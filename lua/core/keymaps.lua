local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--map('n', '<leader>rr', '<Plug>RestNvim')
--map('n', '<leader>rp', '<Plug>RestNvimPreview')
--map('n', '<leader>rl', '<Plug>RestNvimLast')

-- quickly write file
map('n', 'ZS', ':update<CR>')

vim.api.nvim_set_keymap('n', '<leader>a', ':NvimCmpToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n',  '<leader>n', require("nvim-navbuddy").open, {noremap=true})

vim.keymap.set('n', '<leader>th',
               function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
               { noremap = true, silent = true })
