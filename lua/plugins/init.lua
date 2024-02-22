return {
	{
		"mg979/vim-visual-multi",
		event = "VeryLazy",
	},
	{
		"tpope/vim-surround",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.comment").setup()
			require("mini.pairs").setup()
		end,
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function()
			Map("n", "<leader>ut", vim.cmd.UndotreeToggle)
		end,
	},
}
