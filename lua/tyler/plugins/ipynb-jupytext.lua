-- lua/tyler/plugins/ipynb-jupytext.lua
return {
    "GCBallesteros/jupytext.vim",
    lazy = false, -- register BufReadCmd *.ipynb before anything opens
    init = function()
        vim.g.jupytext_fmt = "md"
        -- Use whichever jupytext is on PATH so this works on any machine. When none is found the
        -- plugin falls back to its own default of "jupytext".
        local jupytext = vim.fn.exepath("jupytext")
        if jupytext ~= "" then
            vim.g.jupytext_command = jupytext
        end
        vim.g.jupytext_verbose = 0
        vim.g.jupytext_confirm_overwrite = 0
    end,
}
