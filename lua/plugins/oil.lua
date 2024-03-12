return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, "..")
				end,
			},
		})

		vim.keymap.set("n", "-", vim.cmd.Oil)
	end,
}
