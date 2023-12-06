return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'searchcount', 'filetype', 'filesize' },
                lualine_y = { 'location' },
                lualine_z = { function() return os.time() end}
            },
        }
    end
}
