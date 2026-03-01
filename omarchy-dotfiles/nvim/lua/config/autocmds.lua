-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Set working directory to project root",
  callback = function(args)
    local buf = args.buf
    local file = vim.api.nvim_buf_get_name(buf)
    if file == "" then
      return
    end

    local root = vim.fs.root(file, {
      ".git",
      "package.json",
      "pyproject.toml",
      "go.mod",
    })

    if root and vim.fn.getcwd() ~= root then
      vim.cmd("cd " .. root)
    end
  end,
})

vim.api.nvim_create_autocmd("DirChanged", {
  desc = "Update terminal title on cwd change",
  callback = function()
    vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " - nvim"
  end,
})
