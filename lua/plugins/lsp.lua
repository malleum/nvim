return {
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
    },
    event = "VeryLazy",
    config = function()
        local lsp = require('lsp-zero').preset({
            name = 'minimal',
            set_lsp_keymaps = true,
            manage_nvim_cmp = true,
            suggest_lsp_servers = true,
        })

        lsp.ensure_installed({
            "pyright",
            "kotlin_language_server",
            "lua_ls",
            "jdtls",
            "clangd",
        })

        lsp.on_attach(function(client, buf)
            local lsp_map = function(m, k, a) vim.keymap.set(m, k, a, { buffer = buf, remap = false }) end

            lsp_map("n", "gd", function() vim.lsp.buf.definition() end)
            lsp_map("n", "K", function() vim.lsp.buf.hover() end)
            lsp_map("n", "<leader><leader>ws", function() vim.lsp.buf.workspace_symbol() end)
            lsp_map("n", "<leader><leader>d", function() vim.diagnostic.open_float() end)
            lsp_map("n", "[d", function() vim.diagnostic.goto_next() end)
            lsp_map("n", "]d", function() vim.diagnostic.goto_prev() end)
            lsp_map("n", "<leader><leader>ca", function() vim.lsp.buf.code_action() end)
            lsp_map("n", "<leader><leader>rr", function() vim.lsp.buf.references() end)
            lsp_map("n", "<leader><leader>rn", function() vim.lsp.buf.rename() end)
            lsp_map("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
            lsp_map("n", "<leader><leader>f", function() vim.lsp.buf.format() end)
        end)

        lsp.nvim_workspace()
        lsp.setup()
    end
}
