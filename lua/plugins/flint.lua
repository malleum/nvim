return {
    {
        "mhartington/formatter.nvim",
        event = "VeryLazy",
        config = function()
            require("formatter").setup {
                logging = true,
                log_level = vim.log.levels.WARN,
                filetype = {
                    python = {
                        require("formatter.filetypes.python").black
                    },
                    nix = {
                        require("formatter.filetypes.nix").nixfmt
                    },
                    ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    }
                }
            }
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
