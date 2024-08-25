return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "HiPhish/nvim-ts-rainbow2",
    },
    config = function()
        -- local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        -- treesitter.setup({ -- enable syntax highlighting
        require("nvim-ts-autotag").setup({ -- enable syntax highlighting
            -- rainbow = {
            --     enable = true,
            --     -- list of languages you want to disable the plugin for
            --     -- disable = { "tsx" },
            --     -- Which query to use for finding delimiters
            --     query = { "rainbow-parens", html = "rainbow-tags", tsx = "rainbow-tags" },
            --     -- Highlight the entire buffer all at once
            --     strategy = require("ts-rainbow").strategy.global,
            -- },
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
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
                "rust", -- add rust support
            },

            sync_install = false,
            ignore_install = {},
            auto_install = true,
            modules = {},

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
