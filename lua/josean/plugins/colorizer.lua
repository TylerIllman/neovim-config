return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      { "*", "!vim" },
      {
        css = true,
        css_fun = true,
      },
    })
  end,
}
