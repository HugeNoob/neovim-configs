return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()

        -- add a keymap
        keys[#keys + 1] = { "gh", vim.lsp.buf.hover, desc = "Hover" }

        -- Fixed offset warning for C files
        require("lspconfig").clangd.setup {
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
            },
        }
    end,
}
