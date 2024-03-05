return {
	{ "lewis6991/gitsigns.nvim", opts = {}, event = "VeryLazy" },
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	{ "mg979/vim-visual-multi", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },
	{ "windwp/nvim-autopairs", opts = {}, event = "VeryLazy" },
	{ "kylechui/nvim-surround", opts = {}, event = "VeryLazy" },
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function()
			Map("n", "<leader>ut", vim.cmd.UndotreeToggle)
		end,
	},
}
