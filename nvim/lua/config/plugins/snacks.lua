return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        image = {
            enabled = true,
            doc = {
                enabled = true,
                inline = true,
                float = true,
                max_width = 80,
                max_height = 40,
            },
        },
    },
    config = function(_, opts)
        require("snacks").setup(opts)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(ev)
                vim.keymap.set("n", "<leader>mi", function()
                    require("snacks").image.hover()
                end, { buffer = ev.buf, desc = "Markdown Image/Diagram Hover" })
            end,
        })
    end,
}
