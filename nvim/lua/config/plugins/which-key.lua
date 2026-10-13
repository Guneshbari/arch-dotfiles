return {
    "folke/which-key.nvim",

    event = "VeryLazy",

    opts = {
        spec = {
            { "<leader>p", group = "Telescope" },
            { "<leader>g", group = "Git" },
            { "<leader>m", group = "Markdown" },
            { "<leader>a", desc = "Add File To Harpoon" },
            { "<leader>u", desc = "Undo Tree" },
            { "<leader>rn", desc = "Rename Symbol" },
            { "<leader>ca", desc = "Code Action" },
        },
    },
}
