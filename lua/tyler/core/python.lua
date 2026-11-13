-- Python settings are intentionally discovered from PATH so this config is
-- portable across machines. Project .venv environments are handled per project.
local python = vim.fn.exepath("python3")

if python ~= "" then
    -- Used by Neovim's Python provider and Python plugins.
    vim.g.python3_host_prog = python
end
