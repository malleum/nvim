return {
    'Eandrju/cellular-automaton.nvim',
    event = "VeryLazy",
    config = function()
        Map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
        Map("n", "<leader>mil", "<cmd>CellularAutomaton game_of_life<CR>")
        Map("n", "<leader>mis", "<cmd>CellularAutomaton slide<CR>")
        Map("n", "<leader>mid", "<cmd>CellularAutomaton down<CR>")
        require("malleum.animate")
    end
}
