return {
	{ "michaeljsmith/vim-indent-object", event = "VeryLazy" },
	-- 	{
	-- 		"ggandor/leap-spooky.nvim",
	-- 		event = "VeryLazy",
	-- 		dependencies = { "ggandor/leap.nvim" },
	-- 		config = function()
	-- 			require("leap").add_default_mappings()
	-- 			vim.keymap.del({ "x", "o" }, "x")
	-- 			vim.keymap.del({ "x", "o" }, "X")
	--
	-- 			require("leap-spooky").setup()
	-- 		end,
	-- 	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			label = { rainbow = { enabled = true } },
			modes = { search = { enabled = false } },
		},
        -- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		},
	},
}
