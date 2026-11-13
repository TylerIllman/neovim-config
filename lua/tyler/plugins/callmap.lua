-- Installs from GitHub. To develop against a local checkout, set NVIM_PLUGIN_DEV to the folder that
-- holds it (for example `export NVIM_PLUGIN_DEV=~/Desktop/nvim-plugins`).
local dev_folder = vim.env.NVIM_PLUGIN_DEV and vim.fs.joinpath(vim.fn.expand(vim.env.NVIM_PLUGIN_DEV), "callmap.nvim")
local source = dev_folder and vim.uv.fs_stat(dev_folder) and { dir = dev_folder } or { "TylerIllman/Callmap" }

return vim.tbl_extend("force", source, {
  name = "callmap.nvim",
  cmd = "Callmap",
  keys = {
    { "<leader>cm", "<cmd>Callmap<cr>", desc = "Call map (callers / callees)" },
  },
  opts = {},
})
