return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("render-markdown").setup({
            file_types = { "markdown", "quarto" },

            -- ⬇️ Disable mode-based flipping (keep rendered in Insert too)
            render_modes = true,

            -- ⬇️ Only “de-render” around the cursor so you can edit comfortably
            anti_conceal = {
                enabled = true,
                margin = 2, -- show raw 1 line above/below the cursor as well
            },

            code = {
                -- render_modes = false, -- extra safety for code blocks
                highlight = "RenderMarkdownCode",
                language_info = false, -- hide long info strings
            },
        })

        -- Example: stronger code-block background (optional)
        -- vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "#0f172a" })
    end,
}
