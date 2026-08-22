return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
    	require("mason-lspconfig").setup({
             ensure_installed = {
            "lua_ls",
	    "ts_ls",
	    "pyright",
	    "clangd",
        },
    })

    vim.lsp.config("lua_ls", {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
            },
        },
    })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("pyright")
    vim.lsp.enable("clangd")

    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
end,
}
