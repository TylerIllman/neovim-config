return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        local function prefer_local_eslint()
            local filename = vim.api.nvim_buf_get_name(0)
            local bin = vim.fs.find(
                { "node_modules/.bin/eslint_d", "node_modules/.bin/eslint" },
                { upward = true, path = filename:match("(.*/)") or ".", type = "file", limit = 1 }
            )[1]
            return bin or "eslint_d" -- fallback to PATH default
        end

        lint.linters.eslint_d.cmd = prefer_local_eslint()

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            javascriptreact = { "eslint_d" },
            typescriptreact = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "pylint" },
        }

        -- Disable the "does not conform to snakecase" error in python
        lint.linters.pylint.args = {
            "--disable:invalid-name",
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
