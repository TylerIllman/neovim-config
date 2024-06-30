return {
  "907th/vim-auto-save", -- Plugin repository
  event = "InsertEnter", -- Load the plugin when entering insert mode
  config = function()
    -- Enable auto-save
    vim.g.auto_save = 1 -- Activate auto-save
    -- Additional options
    vim.g.auto_save_silent = 1 -- Make auto-save silent
    vim.g.auto_save_delay = 200 -- Delay in milliseconds before saving
  end,
}
