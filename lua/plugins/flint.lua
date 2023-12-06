return {
    {
        "stevearc/conform.nvim",
        opts = {},
        event = "VeryLazy",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "ruff_format" },
                    nix = { "alejandra" },
                    ["*"] = { "trim_whitespace" },
                },
                format_on_save = {
                    timeout_ms = 50,
                    lsp_fallback = false,
                    formatters_by_ft = {
                        ["*"] = { "trim_whitespace" }
                    }
                },
            })
        end
    },
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = { python = { "ruff" } }
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function() lint.try_lint() end,
            })
        end
    }
}
