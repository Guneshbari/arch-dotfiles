-- Omarchy generates neovim.lua whenever a desktop theme is applied.
-- The generated spec includes the theme plugin and a LazyVim entry.
-- We extract the theme plugin and colorscheme name to apply them in custom lazy.nvim.
local candidate_paths = {
  vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua"),
  vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua"),
  vim.fn.expand("~/.config/aether/theme/neovim.lua"),
}

local generated = nil
for _, path in ipairs(candidate_paths) do
  if vim.fn.filereadable(path) == 1 then
    local ok, res = pcall(dofile, path)
    if ok and type(res) == "table" then
      generated = res
      break
    end
  end
end

if not generated then
  return {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    lazy = false,
    priority = 1000,
    config = function()
      local ok, aether = pcall(require, "aether")
      if ok then
        aether.setup()
        pcall(vim.cmd.colorscheme, "aether")
      end
    end,
  }
end

local theme = nil
local colorscheme = nil
local extra_opts = {}

for _, spec in ipairs(generated) do
  if type(spec) == "table" then
    if spec[1] == "LazyVim/LazyVim" then
      if type(spec.opts) == "table" then
        colorscheme = spec.opts.colorscheme
        extra_opts = spec.opts
      end
    elseif not theme then
      theme = spec
    end
  end
end

if not theme or type(theme) ~= "table" then
  return {}
end

theme.lazy = false
theme.priority = 1000

-- Fallback to infer colorscheme name if not specified in LazyVim opts
if not colorscheme then
  local raw_name = theme.name or (type(theme[1]) == "string" and theme[1]:match("/([^/]+)$")) or ""
  colorscheme = raw_name:match("(.-)%.n?vim$") or raw_name:match("(.-)%-nvim$") or raw_name
end

local orig_config = theme.config

theme.config = function(plugin, opts)
  if type(orig_config) == "function" then
    orig_config(plugin, opts)
  elseif orig_config ~= false then
    local main = plugin.main
    if not main then
      local raw_name = plugin.name or (type(plugin[1]) == "string" and plugin[1]:match("/([^/]+)$")) or ""
      main = raw_name:match("(.-)%.n?vim$") or raw_name:match("(.-)%-nvim$") or raw_name
    end

    if main and main ~= "" then
      local ok_mod, mod = pcall(require, main)
      if ok_mod and type(mod) == "table" and type(mod.setup) == "function" then
        mod.setup(opts or {})
      end
    end
  end

  if extra_opts.background then
    pcall(function()
      vim.o.background = extra_opts.background
    end)
  end

  if colorscheme and colorscheme ~= "" then
    local ok_cs, err = pcall(vim.cmd.colorscheme, colorscheme)
    if not ok_cs then
      vim.notify("Failed to load colorscheme '" .. colorscheme .. "': " .. tostring(err), vim.log.levels.WARN)
    end
  end
end

return theme
