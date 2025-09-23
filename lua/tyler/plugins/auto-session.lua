return {
    "rmagatti/auto-session",
    lazy = false, -- load on startup so restore/save works immediately
    version = "*",

    config = function(_, opts)
        require("auto-session").setup(opts)

        local map = vim.keymap.set
        map("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "Session: Restore (cwd)" })
        map("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Session: Save (cwd)" })
    end,
}
