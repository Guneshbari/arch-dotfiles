return {
  {
    "folke/which-key.nvim",
    opts = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>e", group = "express" },
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      direction = "float",
      start_in_insert = true,
    },
    keys = {
      {
        "<leader>es",
        function()
          local Terminal = require("toggleterm.terminal").Terminal

          -- 🔍 Find the nearest folder with package.json
          local function find_project_root()
            local dir = vim.fn.expand("%:p:h")
            while dir ~= "/" do
              if vim.fn.filereadable(dir .. "/package.json") == 1 then
                return dir
              end
              dir = vim.fn.fnamemodify(dir, ":h")
            end
            return vim.fn.getcwd() -- fallback
          end

          local project_root = find_project_root()

          if vim.fn.filereadable(project_root .. "/package.json") == 0 then
            vim.notify("No package.json found near " .. project_root, vim.log.levels.ERROR)
            return
          end

          local server = Terminal:new({
            cmd = "npm run dev",
            dir = project_root, -- ✅ ensures correct folder no matter which file is open
            hidden = true,
            direction = "float",
            close_on_exit = false,
          })

          server:toggle()

          vim.defer_fn(function()
            vim.fn.jobstart({ "xdg-open", "http://localhost:3000" }, { detach = true })
          end, 2000)

          vim.notify("🚀 Starting Express server from: " .. project_root, vim.log.levels.INFO)
        end,
        desc = "Start Express server (auto open browser)",
      },
      {
        "<leader>ek",
        function()
          vim.fn.system("pkill -f node")
          vim.notify("🛑 Express server stopped", vim.log.levels.INFO)
        end,
        desc = "Stop Express server",
      },
    },
  },
}
