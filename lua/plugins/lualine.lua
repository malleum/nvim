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
                        local function splitString(inputString, delimiter)
                            local result = {}
                            for match in (inputString .. delimiter):gmatch("(.-)" .. delimiter) do
                                table.insert(result, match)
                            end
                            return result
                        end

                        local handle = io.popen("date '+%H:%M:%S:%3N'")
                        if handle == nil then
                            return
                        end
                        local result = handle:read("*a")
                        handle:close()
                        local time = splitString(result, ":")
                        local chrons = math.floor((time[1] * 3600 + time[2] * 60 + time[3] + time[4] / 1000) / .864)
                        return chrons
                    end
                } },
        }
    end
}
