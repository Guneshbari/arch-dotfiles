return {
    "stevearc/conform.nvim",

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },

            javascript = { "prettier" },
            javascriptreact = { "prettier" },

            typescript = { "prettier" },
            typescriptreact = { "prettier" },

            -- Tries prettier first; if missing, falls back to jq (system binary)
            json = { "prettier", "jq", stop_after_first = true },
            jsonc = { "prettier", "jq", stop_after_first = true },
            html = { "prettier" },
            css = { "prettier" },

            python = { "black" },

            c = { "clang-format" },
            cpp = { "clang-format" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback", -- Updated from lsp_fallback
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({
                lsp_format = "fallback", -- Updated from lsp_fallback
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format File" })
    end,
}
