return {
  {
    "folke/which-key.nvim",
    opts = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>v", group = "vite" },
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      direction = "float",
    },
    keys = {
      {
        "<leader>vs",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local vite_server = Terminal:new({
            cmd = "npm run dev",
            hidden = true,
            direction = "float",
            close_on_exit = false,
          })
          vite_server:toggle()
          vim.defer_fn(function()
            vim.fn.jobstart({ "xdg-open", "http://localhost:5173" }, { detach = true })
          end, 2000)
        end,
        desc = "Start Vite server (auto open browser)",
      },
      {
        "<leader>vk",
        function()
          vim.fn.system("pkill -f vite")
          vim.notify("Vite server stopped", vim.log.levels.INFO)
        end,
        desc = "Stop Vite server",
      },
    },
  },
}
