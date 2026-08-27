-- Aether regenerates this file whenever you apply a desktop theme.  Its default
-- output also contains a LazyVim-specific entry, so load only the aether.nvim
-- specification and apply it from this custom lazy.nvim configuration.
local theme_path = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
local ok, generated = pcall(dofile, theme_path)

if not ok or type(generated) ~= "table" or type(generated[1]) ~= "table" then
  return {}
end

local theme = generated[1]
theme.lazy = false
theme.priority = 1000
theme.config = function(_, opts)
  require("aether").setup(opts)
  vim.cmd.colorscheme("aether")
end

return theme
