return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },
            autotag = { enable = true },

            ensure_installed = {
                "markdown",
                "markdown_inline",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "svelte",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "c",
                "rust",
            },

            -- If you still use nvim-ts-rainbow2, keep markdown disabled.
            -- If you don't use rainbow, you can delete this whole block.
            rainbow = {
                enable = false, -- set to true only if the rainbow plugin is installed
                disable = { "markdown", "markdown_inline" },
                query = {
                    "rainbow-parens",
                    html = "rainbow-tags",
                    tsx = "rainbow-tags",
                },
                strategy = (function()
                    local ok, tsr = pcall(require, "ts-rainbow")
                    return ok and tsr.strategy.global or nil
                end)(),
            },
        })

        require("nvim-ts-autotag").setup()

        -- ---------- MAKE MARKDOWN CODE BLOCKS STAND OUT ----------
        -- Fenced code block body (the content between ``` ... ```)
        vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", {
            bg = "#26293a", -- <- change to taste
            fg = "#e0def4",
        })

        -- The fence lines themselves: ```python / ```
        vim.api.nvim_set_hl(0, "@markup.fenced_code.block.markdown", {
            fg = "#89b4fa",
            bold = true,
        })

        -- Inline `code` in paragraphs
        vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", {
            bg = "#343746",
            fg = "#a6e3a1",
        })

        -- Optional: nicer reading defaults for markdown buffers
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "markdown" },
            callback = function()
                vim.opt_local.wrap = true
                vim.opt_local.linebreak = true
                vim.opt_local.conceallevel = 2
            end,
        })
    end,
}
