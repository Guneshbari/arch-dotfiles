return {
  "CRAG666/code_runner.nvim",
  config = function()
    require("code_runner").setup({
      -- Where the code output appears
      mode = "toggleterm", -- uses LazyVim’s built-in terminal
      filetype = {
        python = "python3 -u",
        cpp = "g++ -std=c++17 % -o %< && ./%<",
        java = "javac % && java %<",
      },
    })

    -- Keymap: run current file with <leader>r
    vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { desc = "Run current file" })
  end,
}
