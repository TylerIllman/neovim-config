-- Use the local checkout when it exists (for development), otherwise install from GitHub.
local local_checkout = vim.fn.expand("~/Desktop/nvim-plugins/callmap.nvim")
local source = vim.uv.fs_stat(local_checkout) and { dir = local_checkout } or { "TylerIllman/Callmap" }

return vim.tbl_extend("force", source, {
  name = "callmap.nvim",
  cmd = "Callmap",
  keys = {
    { "<leader>cm", "<cmd>Callmap<cr>", desc = "Call map (callers / callees)" },
  },
  opts = {},
})
