-- Installs from GitHub. To develop against a local checkout, set NVIM_PLUGIN_DEV to the folder that
-- holds it (for example `export NVIM_PLUGIN_DEV=~/Desktop/nvim-plugins`).
local dev_folder = vim.env.NVIM_PLUGIN_DEV
  and vim.fs.joinpath(vim.fn.expand(vim.env.NVIM_PLUGIN_DEV), "stockholm-structure-highlighter.nvim")
local source = dev_folder and vim.uv.fs_stat(dev_folder) and { dir = dev_folder }
  or { "TylerIllman/Stockholm-structure-highlighter" }

return vim.tbl_extend("force", source, {
  name = "stockholm-structure-highlighter.nvim",
  lazy = false, -- the plugin registers the filetype, so load it at startup
  opts = {},
})
