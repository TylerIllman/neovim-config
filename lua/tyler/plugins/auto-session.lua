return {
    "rmagatti/auto-session",
    lazy = false,
    version = "*",

    ---@type AutoSession.Config
    opts = {
        auto_restore = false,
        auto_save = true,

        -- Optional: if you ever have ONLY md/ipynb open, skip saving entirely
        bypass_save_filetypes = { "markdown", "quarto", "ipynb" },

        -- ✅ Strip *.ipynb from the session BEFORE saving; reopen them AFTER
        pre_save_cmds = {
            function()
                local to_reopen = {}
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_option(bufnr, "buflisted") then
                        local name = vim.api.nvim_buf_get_name(bufnr)
                        if name:match("%.ipynb$") then
                            table.insert(to_reopen, name)
                            -- closing ensures mksession won't record it
                            pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
                        end
                    end
                end
                vim.g.__autosession_ipynb_reopen = to_reopen
            end,
        },

        post_save_cmds = {
            function()
                local list = vim.g.__autosession_ipynb_reopen
                if type(list) == "table" then
                    for _, path in ipairs(list) do
                        -- quietly reopen the notebook buffer for your current session only
                        vim.cmd(("silent keepalt keepjumps edit %s"):format(vim.fn.fnameescape(path)))
                    end
                    vim.g.__autosession_ipynb_reopen = nil
                end
            end,
        },

        show_auto_restore_notif = false,
        continue_restore_on_error = true,
        -- keep if you like preventing sessions in “noisy” dirs
        suppressed_dirs = { "~/", "~/Downloads", "/" },
    },

    config = function(_, opts)
        require("auto-session").setup(opts)

        local map = vim.keymap.set
        map("n", "<leader>wr", "<cmd>AutoSession search<CR>", { desc = "Session: Search/Restore" })
        map("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Session: Save (cwd)" })
        map("n", "<leader>wa", "<cmd>AutoSession toggle<CR>", { desc = "Session: Toggle autosave" })
    end,
}
