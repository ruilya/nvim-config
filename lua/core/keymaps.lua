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

-- https://www.reddit.com/r/neovim/comments/13wcqdr/disable_hintslsperrors_etc/
vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })
