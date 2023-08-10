-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "gh", "<Nop>", { remap = true })
map("n", "K", ":m .-2<CR>==", { remap = true, desc = "Move line up (Normal)" })
map("n", "J", ":m .+1<CR>==", { remap = true, desc = "Move line down (Normal)" })
map("v", "K", ":m '<-2<CR>gv=gv", { remap = true, desc = "Move lines up (Visual)" })
map("v", "J", ":m '>+1<CR>gv=gv", { remap = true, desc = "Move lines down (Visual)" })
