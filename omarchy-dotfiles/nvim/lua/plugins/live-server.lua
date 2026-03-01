return {
  {
    "folke/which-key.nvim",
    opts = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>l", group = "live-server" },
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      direction = "float",
      shade_terminals = true,
      hide_numbers = true,
    },
    keys = {
      {
        "<leader>ls",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          -- explicitly use Chromium regardless of system default
          local live_server = Terminal:new({
            cmd = "live-server --quiet --open=chromium",
            hidden = true,
            direction = "float",
            close_on_exit = false,
          })
          live_server:toggle()
        end,
        desc = "Start Live Server (open in Chromium)",
      },
      {
        "<leader>lk",
        function()
          vim.fn.system("pkill -f live-server")
          vim.notify("Live Server stopped", vim.log.levels.INFO)
        end,
        desc = "Stop Live Server",
      },
    },
  },
}
