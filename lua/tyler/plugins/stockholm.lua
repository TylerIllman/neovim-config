-- Use the local checkout when it exists (for development), otherwise install from GitHub.
local local_checkout = vim.fn.expand("~/Desktop/nvim-plugins/stockholm-structure-highlighter.nvim")
local source = vim.uv.fs_stat(local_checkout) and { dir = local_checkout } or { "TylerIllman/Stockholm-structure-highlighter" }

return vim.tbl_extend("force", source, {
  name = "stockholm-structure-highlighter.nvim",
  lazy = false, -- the plugin registers the filetype, so load it at startup
  opts = {},
})
