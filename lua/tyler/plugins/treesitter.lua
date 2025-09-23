return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        -- If you actually use rainbow, also add its plugin here, e.g.
        -- "HiPhish/nvim-ts-rainbow2",
    },
    config = function()
        -- Treesitter core (no `autotag` here anymore)
        require("nvim-treesitter.configs").setup({
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },

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

            -- Optional rainbow config (safe if plugin isn’t installed)
            rainbow = (function()
                local ok = pcall(require, "ts-rainbow")
                if not ok then
                    return { enable = false }
                end
                return {
                    enable = true,
                    disable = { "markdown", "markdown_inline" },
                    query = {
                        "rainbow-parens",
                        html = "rainbow-tags",
                        tsx = "rainbow-tags",
                    },
                    strategy = require("ts-rainbow").strategy.global,
                }
            end)(),
        })

        -- Autotag must be configured separately (new API)
        require("nvim-ts-autotag").setup()

        -- Nice defaults for markdown buffers
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
