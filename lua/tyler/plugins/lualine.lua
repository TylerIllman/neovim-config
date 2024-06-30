return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local colors = {
            blue = "#65D1FF",
            green = "#3EFFDC",
            violet = "#FF61EF",
            yellow = "#FFDA7B",
            red = "#FF4A4A",
            fg = "#c3ccdc",
            bg = "#112638",
            inactive_bg = "#2c3043",
        }

        local my_lualine_theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            insert = {
                a = { bg = colors.green, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            visual = {
                a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            replace = {
                a = { bg = colors.red, fg = colors.bg, gui = "bold" },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
            inactive = {
                a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
                b = { bg = colors.inactive_bg, fg = colors.semilightgray },
                c = { bg = colors.inactive_bg, fg = colors.semilightgray },
            },
        }

        -- local function custom_filename()
        --     local path = vim.fn.expand("%:~:.") -- Gets the relative path with home replaced by ~
        --     local filename = vim.fn.expand("%:t") -- Gets the filename with extension
        --     if path == filename then
        --         return "%#Bold#" .. filename .. "%#Normal#" -- Apply bold if only filename is shown
        --     else
        --         local path_without_filename = path:sub(1, #path - #filename)
        --         return path_without_filename .. "%#Bold#" .. filename .. "%#Normal#"
        --     end
        -- end

        local function custom_filename()
            local path = vim.fn.expand("%:~:.") -- Gets the relative path with home replaced by ~
            local filename = vim.fn.expand("%:t") -- Gets the filename with extension
            if path == filename then
                return "%#lualineBold#" .. filename .. "%#lualineNormal#" -- Apply bold if only filename is shown, this can be changed in options.lua
            else
                local path_without_filename = path:sub(1, #path - #filename)
                return path_without_filename .. "%#lualineBold#" .. filename .. "%#lualineNormal#"
            end
        end

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                theme = my_lualine_theme,
            },
            sections = {
                lualine_c = {
                    {
                        custom_filename,
                        file_status = true, -- Displays file status (readonly status, modified status)
                        -- newfile_status = false, -- Display new file status (new file means no write after created)
                        -- path = 1, -- 1: Relative path
                    },
                },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
        })
    end,
}
