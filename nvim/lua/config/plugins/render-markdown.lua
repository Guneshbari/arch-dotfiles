return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    opts = {
        heading = {
            enabled = true,
            sign = true,
            position = "overlay",
            icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
            signs = { "󰫎 " },
            width = "full",
            left_pad = 0,
            right_pad = 0,
            min_width = 0,
            border = false,
        },
        paragraph = {
            enabled = true,
            left_margin = 0,
            min_width = 0,
        },
        code = {
            enabled = true,
            sign = true,
            style = "full",
            position = "left",
            language_pad = 0,
            language_name = true,
            width = "full",
            border = "thin",
        },
        dash = {
            enabled = true,
            icon = "─",
            width = "full",
        },
        bullet = {
            enabled = true,
            icons = { "●", "○", "◆", "◇" },
            left_pad = 0,
            right_pad = 1,
        },
        checkbox = {
            enabled = true,
            position = "inline",
            unchecked = {
                icon = "󰄱 ",
            },
            checked = {
                icon = "󰱒 ",
            },
            custom = {
                todo = { raw = "[-]", rendered = "󰥔 " },
            },
        },
        quote = {
            enabled = true,
            icon = "▋",
            repeat_linebreak = false,
        },
        pipe_table = {
            enabled = true,
            preset = "round",
            style = "full",
            cell = "padded",
            padding = 1,
            alignment_indicator = "━",
        },
        callout = {
            note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
            tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
            important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
            warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
            caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
        },
        link = {
            enabled = true,
            image = "󰥶 ",
            email = "󰇮 ",
            hyperlink = "󰌹 ",
        },
        sign = {
            enabled = true,
        },
        anti_conceal = {
            enabled = true,
            ignore = {
                head_icon = true,
                head_background = true,
                head_border = true,
                code_background = true,
                code_border = true,
            },
            above = 0,
            below = 0,
        },
    },
    config = function(_, opts)
        require("render-markdown").setup(opts)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(ev)
                vim.keymap.set("n", "<leader>mt", function()
                    require("render-markdown").toggle()
                end, { buffer = ev.buf, desc = "Toggle Markdown Render" })

                vim.keymap.set("n", "<leader>mp", function()
                    require("render-markdown").preview()
                end, { buffer = ev.buf, desc = "Toggle Markdown Preview" })
            end,
        })
    end,
}
