return {
	{
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_method = "Okular"
			vim.g.vimtex_compiler_method = "latexrun"
		end,
	},
	{ "lewis6991/gitsigns.nvim", opts = {}, event = "VeryLazy" },
	{ "tpope/vim-fugitive", event = "VeryLazy", config = function()
        Map("n", "<leader>g", vim.cmd([[G]]))
    end },
}
