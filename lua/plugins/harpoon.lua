return {
    'ThePrimeagen/harpoon',
    event = "VeryLazy",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        Map("n", "<leader>a", mark.add_file)
        Map("n", "<leader>o", ui.toggle_quick_menu)
        Map("n", "<A-h>", function() ui.nav_file(1) end)
        Map("n", "<A-t>", function() ui.nav_file(2) end)
        Map("n", "<A-n>", function() ui.nav_file(3) end)
        Map("n", "<A-s>", function() ui.nav_file(4) end)
    end

}
