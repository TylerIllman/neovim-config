-- lua/tyler/plugins/ipynb-jupytext.lua
return {
    "GCBallesteros/jupytext.vim",
    lazy = false, -- register BufReadCmd *.ipynb before anything opens
    init = function()
        vim.g.jupytext_fmt = "md"
        vim.g.jupytext_command = "/opt/homebrew/anaconda3/bin/jupytext"
        vim.g.jupytext_verbose = 0
        vim.g.jupytext_confirm_overwrite = 0
    end,
}
