return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local rm = require("render-markdown")

        rm.setup({
            -- don’t disable all ft’s; tell it we want md + qmd
            file_types = { "markdown", "quarto" },
            code = {
                highlight = "RenderMarkdownCode",
                language_info = false,
            },
            anti_conceal = { enabled = true, margin = 2 },
        })

        -- extra guard: disable for popups/floating windows
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function(args)
                local bt = vim.bo[args.buf].buftype
                local ft = vim.bo[args.buf].filetype
                if bt ~= "" then
                    rm.buf_disable(args.buf)
                elseif ft == "markdown" or ft == "quarto" then
                    rm.buf_enable(args.buf)
                end
            end,
        })
    end,
}
