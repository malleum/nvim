return {
	{
		"lervag/vimtex",
		event = "VeryLazy",
		config = function()
			vim.g.vimtex_view_method = "Okular"
		end,
	},
	{ "lewis6991/gitsigns.nvim", opts = {}, event = "VeryLazy" },
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>g", "<cmd>G<cr>")
		end,
	},
}
