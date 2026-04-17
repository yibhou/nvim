return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        commands = {
          cursorcli_add_file = function(state)
            local node = state.tree:get_node()
            if not node then
              return
            end
            local filepath = node:get_id()
            if vim.fn.isdirectory(filepath) == 1 then
              vim.notify("please select a file", vim.log.levels.WARN)
              return
            end
            local bufnr = vim.fn.bufadd(filepath)
            vim.fn.bufload(bufnr)
            local line_end = math.max(vim.api.nvim_buf_line_count(bufnr), 1)
            require("cursorcli").add_selection(1, line_end, bufnr)
          end,
        },
        window = {
          mappings = {
            ["oa"] = "cursorcli_add_file",
          },
        },
      },
    },
  },

  -- https://github.com/zbirenbaum/copilot.lua
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = vim.fn.expand("$HOME/.asdf/installs/nodejs/22.22.0/bin/node"),
    },
  },

  -- https://github.com/coder/claudecode.nvim
  {
    "coder/claudecode.nvim",
    opts = {
      diff_opts = {
        keep_terminal_focus = true,
      },
    },
  },

  -- https://github.com/suiramdev/cursorcli.nvim
  {
    "suiramdev/cursorcli.nvim",
    event = "VeryLazy",
    opts = {
      position = "right",
    },
    -- stylua: ignore
    keys = {
      { "gan", function() require("cursorcli").new_chat() end, mode = "n", desc = "Cursor: New chat" },
      { "gas", function() require("cursorcli").select_chat() end, mode = "n", desc = "Cursor: Select chat" },
      { "gat", "<Cmd>CursorCliToggle<CR>", mode = "n", desc = "Cursor: Toggle" },
      { "gaa", function() require("cursorcli").add_visual_selection() end, mode = "x", desc = "Cursor: Add visual selection" },
      { "gak", function() require("cursorcli").quick_edit() end, mode = "x", desc = "Cursor: Quick edit" },
      {
        "gab",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local filename = vim.api.nvim_buf_get_name(bufnr)
          if filename == "" then
            return
          end
          local line_end = math.max(vim.api.nvim_buf_line_count(bufnr), 1)
          require("cursorcli").add_selection(1, line_end, bufnr)
        end,
        mode = "n",
        desc = "Cursor: Add current buffer",
      },
    },
  },
}
