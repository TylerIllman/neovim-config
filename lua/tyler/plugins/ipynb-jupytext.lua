-- lua/tyler/plugins/ipynb-jupytext.lua
return {
    "GCBallesteros/jupytext.vim",
    lazy = false, -- <-- load at startup so BufReadCmd *.ipynb is registered
    init = function()
        vim.g.jupytext_fmt = "md" -- start simple; switch to "qmd" later if you want Quarto
        -- If `:echo executable('jupytext')` is 0, set the absolute path:
        -- vim.g.jupytext_command = "/opt/homebrew/anaconda3/bin/jupytext"
    end,
}
