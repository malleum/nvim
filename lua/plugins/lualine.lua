return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            options = {
                refresh = {
                    statusline = 864,
                    tabline = 864,
                    winbar = 864
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'searchcount', 'filetype', 'filesize' },
                lualine_y = { 'location' },
                lualine_z = {
                    function()
                        local handle = io.popen("curl -s joshammer.xyz/mt")
                        if handle == nil then
                            return
                        end
                        local result = handle:read("*a")
                        handle:close()
                        return result
                    end
                } },
        }
    end
}
