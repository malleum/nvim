return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("telescope").setup({
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})
		require("telescope").load_extension("fzy_native")

		local t = require("telescope.builtin")

		Map("n", "<leader>h", t.find_files)
		Map("n", "<C-p>", t.git_files)
		Map("n", "<leader>pp", t.git_files)
		Map("n", "<leader>pd", t.diagnostics)
		Map("n", "<leader>ph", t.help_tags)
		Map("n", "<leader>pr", t.lsp_references)

		Map("n", "<leader>ps", function()
			t.grep_string({ search = vim.fn.input("invenire > ") })
		end)
		Map("n", "<leader>pw", function()
			t.grep_string({ search = vim.fn.expand("<cword>") })
		end)
		Map("n", "<leader>pW", function()
			t.grep_string({ search = vim.fn.expand("<cWORD>") })
		end)
	end,
}
