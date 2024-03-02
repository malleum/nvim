return {
	{ "michaeljsmith/vim-indent-object", event = "VeryLazy" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			label = { rainbow = { enabled = true } },
			modes = {
				search = { enabled = false },
				char = { keys = { "f", "F", "t", "T", [";"] = "<cr>", [","] = "<tab>" } },
				remote_op = { restore = true, motion = true },
			},
		},
        -- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash", },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		},
	},
}
