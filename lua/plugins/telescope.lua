return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.95,
					height = 0.85,
					prompt_position = "top",
					horizontal = {
						preview_width = function(_, cols, _)
							if cols > 200 then
								return math.floor(cols * 0.4)
							else
								return math.floor(cols * 0.6)
							end
						end,
					},
				},
			},
		})
		local t = require("telescope.builtin")

		vim.keymap.set("n", "<leader>h", t.find_files)
		vim.keymap.set("n", "<C-p>", t.git_files)
		vim.keymap.set("n", "<leader>pp", t.git_files)
		vim.keymap.set("n", "<leader>pd", t.diagnostics)
		vim.keymap.set("n", "<leader>ph", t.help_tags)
		vim.keymap.set("n", "<leader>pr", t.lsp_references)

		vim.keymap.set("n", "<leader>ps", t.live_grep)
		vim.keymap.set("n", "<leader>pw", function()
			t.grep_string({ search = vim.fn.expand("<cword>") })
		end)
		vim.keymap.set("n", "<leader>pW", function()
			t.grep_string({ search = vim.fn.expand("<cWORD>") })
		end)
	end,
}
