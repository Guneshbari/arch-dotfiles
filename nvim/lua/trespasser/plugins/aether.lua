local spec = dofile(vim.fn.expand("~/.config/aether/theme/neovim.lua"))

local plugin = spec[1]

plugin.config = function(_, opts)
    require("aether").setup(opts)
    vim.cmd.colorscheme("aether")
end

return plugin
