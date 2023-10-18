return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format.with({
                    filetypes = { "c", "c++" },
                    extra_args = { "-style={IndentWidth: 4}" },
                }),
            },
        })
    end,
}
