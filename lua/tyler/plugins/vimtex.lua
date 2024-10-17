-- return {
--     -- other plugins
--
--     -- Add vimtex for LaTeX support
--     {
--         "lervag/vimtex",
--         config = function()
--             -- Configure vimtex
--             vim.g.vimtex_view_method = "zathura" -- Zathura as PDF viewer
--             vim.g.vimtex_compiler_method = "latexmk" -- latexmk for compilation
--             vim.g.vimtex_quickfix_mode = 0 -- Disable quickfix popup
--         end,
--     },
--
--     -- other plugins
-- }
--

return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk" -- Automatically compile LaTeX files using latexmk
        vim.g.vimtex_quickfix_mode = 0 -- Disable quickfix window from opening automatically
    end,
}
