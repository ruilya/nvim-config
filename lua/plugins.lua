local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup{
    { "tpope/vim-fugitive", },
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust" },
                highlight = { enable = true, }
            }
        end },
    { "nvim-telescope/telescope.nvim",
       tag = "0.1.2",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
        { "<C-t>", "<CMD>Telescope<CR>", mode = { "n", "i", "v" } },
        { "<leader>ff", "<CMD>Telescope find_files<CR>", mode = { "n", "i", "v" } },
        { "<leader>fg", "<CMD>Telescope live_grep<CR>", mode = { "n", "i", "v" } },
        { "<leader>fb", "<CMD>Telescope buffers<CR>", mode = { "n", "i", "v" } },
        { "<leader>fh", "<CMD>Telescope help_tags<CR>", mode = { "n", "i", "v" } },
        --{ "<C-c>", "<CMD>Telescope commands<CR>", mode = { "n", "i", "v" } },
        { "<C-k>", "<CMD>Telescope keymaps<CR>", mode = { "n", "i", "v" } },
        { "<C-s>", "<CMD>Telescope grep_string<CR>", mode = { "n", "i", "v" } },
    },
    config = true },
    {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
    },
    { "fatih/vim-go", },
    { "ishan9299/nvim-solarized-lua" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'solarized_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "cpp", "bash", "go", "lua", "vim", "vimdoc", "query" },
  --ensure_installed = { "all" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "javascript" },
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
