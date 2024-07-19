vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sw", "<C-w>r", { desc = "Swap two split windows" }) -- Swap two split windows

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tk", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tj", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- set 'U' to redo
keymap.set("n", "U", "<C-r>", { desc = "redo changes" })

-- Go to next tab with Ctrl+U
keymap.set("n", "<C-i>", "<cmd>tabnext<CR>", { desc = "Go to next tab" })

-- Go to previous tab with Ctrl+I
keymap.set("n", "<C-u>", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })

-- Run current Python file
keymap.set("n", "<leader>pr", ':!python3 "%"<CR>', { desc = "Run current Python file" })

-- cargo run
keymap.set("n", "<leader>cr", ":!Cargo run<CR>", { desc = "Cargo run" })

-- clear '/' seacht
keymap.set("n", "<leader>cs", "<cmd>:now<CR>", { desc = "Clear '/' search" })

local function get_line_diagnostics()
    vim.diagnostic.open_float()
    vim.schedule(function()
        vim.diagnostic.open_float()
        vim.cmd("normal! ggVGy") -- Your existing line command

        -- Close the diagnostic float after opening it twice
        local float_buf = vim.api.nvim_get_current_buf()
        local float_win = vim.fn.win_findbuf(float_buf)[1] -- Get the window ID of the current buffer
        if float_win then
            vim.api.nvim_win_close(float_win, false)
        end
    end)
end

-- Set keymap to run the function
vim.keymap.set("n", "<leader>yd", get_line_diagnostics, { desc = "Open diagnostics float twice" })

-- Run browser sync
keymap.set(
    "n",
    "<leader>bs",
    ':!browser-sync start --server --files "*.html, *.css, *.js" --no-notify --directory<CR>',
    { desc = "Start BrowserSync" }
)

-- Delete all instances of word under cursor with check
vim.keymap.set("n", "<leader>fd", function()
    local word = vim.fn.expand("<cword>") -- Gets the word under the cursor
    local pattern = "\\<" .. word .. "\\>\\s*" -- Pattern matches the whole word and any trailing whitespace
    local command = ":%s/" .. pattern .. "//gc" -- Constructs the substitution command
    vim.cmd(command) -- Executes the command, now removing the word and any trailing whitespace globally
end, { desc = "Delete all instances of the word under the cursor and trailing whitespace" })

-- Replace all instances of word under cursor with user input
vim.keymap.set("n", "<leader>rw", function()
    local word = vim.fn.expand("<cword>") -- Gets the word under the cursor
    local newWord = vim.fn.input("Replace '" .. word .. "' with: ") -- Asks for the replacement word
    if newWord ~= "" then
        local pattern = "\\<" .. vim.fn.escape(word, "\\/.*'$^~[]") .. "\\>" -- Escape special characters in word and form the pattern
        local command = ":%s/" .. pattern .. "/" .. vim.fn.escape(newWord, "/\\&") .. "/gc" -- Constructs the substitution command with confirmations
        vim.cmd(command) -- Executes the command
    else
        print("No replacement word provided.")
    end
end, { desc = "Replace all instances of the word under the cursor with user input" })

-- Map visual mode yank to keep the cursor at the end of the selection
vim.keymap.set(
    "v",
    "y",
    "ygv<Esc>`>",
    { noremap = true, silent = true, desc = "Yank and move cursor to the end of the selection" }
)

-- Copy whole file and return curor to starting position
vim.keymap.set("n", "<leader>ya", function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd("normal! ggVGy")
    vim.fn.setpos(".", save_cursor)
end, { noremap = true, silent = true, desc = "Copy the whole file and restore cursor position" })

keymap.set("n", "<leader>jr", ":!node %<CR>", { desc = "Run current JS file with Node" })
