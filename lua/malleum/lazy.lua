
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

require("lazy").setup({

    'wbthomason/packer.nvim',

    'EdenEast/nightfox.nvim',
    'mhartington/oceanic-next',

    -- gA to show numbers in base 10, 2 , 8, 16
    -- crd, crx, cro, crb
    {
        'glts/vim-radical',
        requires = { 'glts/vim-magnum' }
    },

    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },

    'ThePrimeagen/harpoon',
    'unblevable/quick-scope',
    'ntpeters/vim-better-whitespace',

    'mbbill/undotree',
    'tpope/vim-fugitive',
    'Eandrju/cellular-automaton.nvim',
    'xiyaowong/nvim-transparent',

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    'mg979/vim-visual-multi',
    'tpope/vim-commentary',
    'tpope/vim-surround',
    'udalov/kotlin-vim',
    'stevearc/oil.nvim',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    },


    'akinsho/toggleterm.nvim', version = "*", config = true,

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },
})
