return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local function hrpnslct(num)
			harpoon:list():select(num)
		end

        -- stylua: ignore
		vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        -- stylua: ignore
		vim.keymap.set("n", "<leader>o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        -- stylua: ignore
		vim.keymap.set("n", "<C-A-h>", function() hrpnslct(1) end)
        -- stylua: ignore
		vim.keymap.set("n", "<C-A-t>", function() hrpnslct(2) end)
        -- stylua: ignore
		vim.keymap.set("n", "<C-A-n>", function() hrpnslct(3) end)
        -- stylua: ignore
		vim.keymap.set("n", "<C-A-s>", function() hrpnslct(4) end)
	end,
}
