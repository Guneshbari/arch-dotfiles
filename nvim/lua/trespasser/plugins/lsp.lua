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
end,
    }
