return {
	{ "mg979/vim-visual-multi", event = "VeryLazy" },
	{ "kylechui/nvim-surround", event = "VeryLazy" },
	{ "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },
	{ "windwp/nvim-autopairs", opts = {}, event = "VeryLazy" },
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function()
			Map("n", "<leader>ut", vim.cmd.UndotreeToggle)
		end,
	},
}
