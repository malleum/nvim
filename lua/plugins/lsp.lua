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
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',

        -- Snippets
        { 'L3MON4D3/LuaSnip', version = "2.*", build = "make install_jsregexp" },
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
                "kotlin_language_server",
                "pyright",
                "jsonls",
                "jdtls",
                "gopls",
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
            lsp_map("n", "<leader><leader>f", function()
                if vim.bo.filetype == "python" then
                    vim.cmd([[Format]])
                else
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end
            end)
            lsp_map("n", "<leader>ts", "<cmd>Telescope lsp_references<cr>")
        end)

        local lspconfig = require('lspconfig')
        lspconfig.kotlin_language_server.setup({})
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.pyright.setup({})
        lspconfig.clangd.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.jdtls.setup({})
        lspconfig.gopls.setup({})

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require("cmp")
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require 'luasnip'.lsp_expand(args.body)
                end
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "buffer" },
            },
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp_action.luasnip_supertab(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
            }
        })
    end
}
