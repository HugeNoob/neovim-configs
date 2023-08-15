vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context()
end, { silent = true, desc = "Jump to previous context" })

return {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
        require("treesitter-context").setup({
            enable = true,
        })
    end,
}
