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
    -- { "fatih/vim-go", },
    { "ishan9299/nvim-solarized-lua" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    { "farmergreg/vim-lastplace" },
    { "lewis6991/gitsigns.nvim" },
    { "rhysd/vim-clang-format" },
    { "https://bitbucket.org/JohnKaul/qbs.vim" },
    { "alepez/vim-gtest" },
    {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp"
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    -- { "hrsh7th/cmp-nvim-lsp" },
    -- { "hrsh7th/cmp-buffer" },
    -- { "hrsh7th/cmp-path" },
    -- { "hrsh7th/cmp-cmdline" },
    -- { "hrsh7th/nvim-cmp" },
    {
      "ray-x/go.nvim",
      dependencies = {  -- optional packages
         "ray-x/guihua.lua",
      },
      config = function()
        require("go").setup()
      end,
      event = {"CmdlineEnter"},
      ft = {"go", 'gomod'},
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
}
