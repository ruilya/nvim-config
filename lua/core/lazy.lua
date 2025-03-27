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
    { "shumphrey/fugitive-gitlab.vim" },
    { "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.3",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "lua", "rust" },
                highlight = { enable = true, }
            }
        end
    },
    { "nvim-telescope/telescope.nvim",
       tag = "0.1.6",
       dependencies = {
           { 
               "nvim-telescope/telescope-live-grep-args.nvim" ,
               -- This will not install any breaking changes.
               -- For major updates, this must be adjusted manually.
               version = "^1.0.0",
           },
           {
               "nvim-lua/plenary.nvim",
           },
       },
       keys = {
           { "<C-t>", "<CMD>Telescope<CR>", mode = { "n", "i", "v" } },
           { "<leader>tff", "<CMD>Telescope find_files<CR>", mode = { "n", "i", "v" } },
           --{ "<leader>tfg", "<CMD>Telescope live_grep<CR>", mode = { "n", "i", "v" } },
           --keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
           {  "<leader>tfg", "<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", mode = { "n" } },
           { "<leader>tfb", "<CMD>Telescope buffers<CR>", mode = { "n", "i", "v" } },
           { "<leader>tfh", "<CMD>Telescope help_tags<CR>", mode = { "n", "i", "v" } },
           { "<leader>tgb", "<CMD>Telescope git_branches<CR>", mode = { "n", "i", "v" } },
           { "<leader>tgs", "<CMD>Telescope git_status<CR>", mode = { "n", "i", "v" } },
           --{ "<C-c>", "<CMD>Telescope commands<CR>", mode = { "n", "i", "v" } },
           --{ "<C-k>", "<CMD>Telescope keymaps<CR>", mode = { "n", "i", "v" } },
           { "<C-s>", "<CMD>Telescope grep_string<CR>", mode = { "n", "i", "v" } },
       },
       config = true
    },
    {
        "iamcco/markdown-preview.nvim",
        config = function()
          vim.fn["mkdp#util#install"]()
        end,
    },
    {
      "ray-x/go.nvim",
      dependencies = {  -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("go").setup({
          verbose = true,  -- output loginf in messages
          log_path = vim.fn.expand("$HOME") .. "/.cache/nvim/gonvim.log",
          lsp_inlay_hints = {
            enable = false,
          },
        })
      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    { "ishan9299/nvim-solarized-lua" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    { "farmergreg/vim-lastplace" },
    { "lewis6991/gitsigns.nvim" },
    { "https://bitbucket.org/JohnKaul/qbs.vim" },
    { "alepez/vim-gtest" },
    {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'nvim-tree/nvim-web-devicons'},
    {'onsails/lspkind.nvim'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {
        'hrsh7th/nvim-cmp',
        event = { "InsertEnter", "CmdlineEnter" }
    },
    { 'saadparwaiz1/cmp_luasnip' }, -- Snippets source for nvim-cmp
    { "SmiteshP/nvim-navbuddy" },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim",
                    "numToStr/Comment.nvim",        -- Optional
                    "nvim-telescope/telescope.nvim", -- Optional
                },
            },
        },
    },
    {
        'gitaarik/nvim-cmp-toggle',
        dependencies = {
            'hrsh7th/nvim-cmp'
        },
    },
    {
        'f-person/git-blame.nvim',
    },
    {
        'nvim-treesitter/nvim-treesitter-context'
    },
}
