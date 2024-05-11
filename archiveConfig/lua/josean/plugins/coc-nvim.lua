return {
  "folke/tokyonight.nvim", -- Theme
  "neoclide/coc.nvim", -- CoC (Conquer of Completion) plugin
  priority = 1000,
  config = function()
    -- Theme configuration
    -- Your theme configuration here

    -- CoC configuration
    vim.cmd([[
            " Configure CoC
            " Example: Enable completion and documentation for Python
            autocmd FileType python lua require('plugins.coc').setup_python()
        ]])
  end,
}
