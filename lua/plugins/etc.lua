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
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "VeryLazy",
		config = function()
			require("neogit").setup({})
			vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>")
		end,
	},
}
