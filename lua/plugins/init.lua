return {

    'EdenEast/nightfox.nvim',
    'mhartington/oceanic-next',

    'unblevable/quick-scope',
    'ntpeters/vim-better-whitespace',
    'mbbill/undotree',
    'Eandrju/cellular-automaton.nvim',
    'xiyaowong/nvim-transparent',
    'mg979/vim-visual-multi',
    'tpope/vim-commentary',
    'tpope/vim-surround',
    'udalov/kotlin-vim',
    'stevearc/oil.nvim',
    'akinsho/toggleterm.nvim', version = "*", config = true,

    {
        "windwp/nvim-autopairs", opts = {}
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },

    -- gA to show numbers in base 10, 2 , 8, 16
    -- crd crb cro crx
    {
        'glts/vim-radical',
        dependencies = 'glts/vim-magnum'
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    },
}
