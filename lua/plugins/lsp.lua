return {
    'VonHeikemen/lsp-zero.nvim',
    branch = "v3.x",
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
        { "folke/neoconf.nvim", cmd = "Neoconf" },

        -- Snippets
        { 'L3MON4D3/LuaSnip',   version = "2.*", build = "make install_jsregexp" },
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',

        -- Yooo
        { 'akinsho/flutter-tools.nvim' },
        { "j-hui/fidget.nvim",         opts = {} },

    },
    event = "VeryLazy",
    config = function()
        local function isNixOS()
            local file = io.open("/etc/os-release", "r")

            if file then
                local content = file:read("*all")
                file:close()

                -- Check if the content of the file contains "NixOS"
                return string.match(content, "NixOS") ~= nil
            else
                return false -- File not found, not NixOS
            end
        end

        local nixhost = isNixOS()

        local extra_langs = {
            "pyright",
            "isort",
            "lua_ls",
            "jsonls",
        }
        if nixhost then
            extra_langs = {
                "gopls",
                "html",
                "htmx",
                "jdtls",
                "jsonls",
                "kotlin_language_server",
                "nil_ls",
                "pyright",
                "rnix",
            }
        end

        local lsp = require('lsp-zero').preset({
            manage_nvim_cmp = {
                set_extra_mappings = true
            }
        })

        require("mason").setup({})
        Map("n", "<leader>m", vim.cmd.Mason)
        require("mason-lspconfig").setup({
            ensure_installed = extra_langs,
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
            lsp.default_keymaps({
                buffer = buf,
                include = {
                    "K",  -- Hover
                    "gl", -- diagnostic open float
                    "gr", -- references
                    "gd", -- definition
                    "gD", -- declaration
                    "gi", -- implementation
                    "go", -- type definition
                    "gs", -- signiture help
                    "[d", -- next/prev error
                    "]d",
                },
                exclude = { "f2", "f3", "f4" }
            })

            local lsp_map = function(m, k, a) vim.keymap.set(m, k, a, { buffer = buf, remap = false }) end

            lsp_map("n", "<leader>rn", function() vim.lsp.buf.rename() end)
            lsp_map("n", "<leader>ra", function() vim.lsp.buf.code_action() end)
            lsp_map("n", "<leader>rr", function() vim.lsp.buf.references() end)

            lsp_map("n", "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end)
        end)

        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        lspconfig.pyright.setup({})
        lspconfig.jsonls.setup({})

        if nixhost then
            lspconfig.clangd.setup({})
            lspconfig.dartls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.html.setup({})
            lspconfig.htmx.setup({})
            lspconfig.jdtls.setup({})
            lspconfig.kotlin_language_server.setup({})
            lspconfig.nil_ls.setup({})
            lspconfig.rnix.setup({})
        end

        require("luasnip.loaders.from_vscode").lazy_load()

        local cmp = require("cmp")
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
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
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
            }
        })

        require('flutter-tools').setup({
            lsp = {
                capabilities = lsp.get_capabilities()
            }
        })
    end
}
