vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'EdenEast/nightfox.nvim'
    use 'mhartington/oceanic-next'

    -- gA to show numbers in base 10, 2 , 8, 16
    -- crd, crx, cro, crb
    use {
        'glts/vim-radical',
        requires = { 'glts/vim-magnum' }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use 'ThePrimeagen/harpoon'
    use 'justinmk/vim-sneak'
    use 'unblevable/quick-scope'
    use 'ntpeters/vim-better-whitespace'

    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'Eandrju/cellular-automaton.nvim'
    use 'xiyaowong/nvim-transparent'

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'mg979/vim-visual-multi'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'udalov/kotlin-vim'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
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
    }
end)
