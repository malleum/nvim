return {
	{ "michaeljsmith/vim-indent-object", event = "VeryLazy" },
	{
		"ggandor/leap-spooky.nvim",
		event = "VeryLazy",
		dependencies = {
			"ggandor/flit.nvim",
			"tpope/vim-repeat",
			"ggandor/leap.nvim",
		},
		config = function()
			require("leap").add_default_mappings()
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
			require("flit").setup({})

			require("leap-spooky").setup({})
		end,
	},
}
