return {
    'VonHeikemen/lsp-zero.nvim',
    branch = "dev-v3",
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
    },
    event = "VeryLazy",
    config = function()
        local lsp = require('lsp-zero').preset({
            manage_nvim_cmp = {
                set_extra_mappings = true
            }
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright",
                "kotlin_language_server",
                "lua_ls",
                "jdtls",
                "clangd",
            },
            handlers = { lsp.default_setup }
        })

        lsp.extend_cmp()
        lsp.set_sign_icons({
            error = '✘',
            warn = '▲',
            hint = '⚑',
            info = '»'
        })

        lsp.on_attach(function(client, buf)
            lsp.default_keymaps({ buffer = buf })

            local lsp_map = function(m, k, a) vim.keymap.set(m, k, a, { buffer = buf, remap = false }) end

            lsp_map("n", "<leader><leader>d", function() vim.diagnostic.open_float() end)
            lsp_map("n", "<leader><leader>ca", function() vim.lsp.buf.code_action() end)
            lsp_map("n", "<leader><leader>rr", function() vim.lsp.buf.references() end)
            lsp_map("n", "<leader><leader>rn", function() vim.lsp.buf.rename() end)
            lsp_map("n", "<leader><leader>f", function() vim.lsp.buf.format() end)
            lsp_map("n", "<leader>ts", "<cmd>Telescope lsp_references<cr>")
        end)

        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.pyright.setup({})

        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }
        })
        lsp.setup()
    end
}
