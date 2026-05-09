local function sidekick_send(msg)
  local cli = require("sidekick.cli")
  local attached = require("sidekick.cli.state").get({ attached = true })
  if attached and #attached ~= 0 then
    cli.send({ msg = msg, focus = false })
    return
  end
  cli.select({
    cb = function(state)
      if not state then
        return
      end
      require("sidekick.cli.state").attach(state, { show = true, focus = false })
      cli.send({ msg = msg, focus = false })
    end,
  })
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        commands = {
          sidekick_add = function(state)
            local node = state.tree:get_node()
            if not node then
              return
            end
            sidekick_send("@" .. vim.fn.fnamemodify(node:get_id(), ":."))
          end,
          sidekick_add_visual = function(_, selected_nodes)
            if not selected_nodes or #selected_nodes == 0 then
              return
            end
            local paths = {}
            for _, node in ipairs(selected_nodes) do
              paths[#paths + 1] = "@" .. vim.fn.fnamemodify(node:get_id(), ":.")
            end
            sidekick_send(table.concat(paths, " "))
          end,
          cursorcli_add_file = function(state)
            local node = state.tree:get_node()
            if not node then
              return
            end
            if node.type == "directory" then
              vim.notify("please select a file", vim.log.levels.WARN)
              return
            end
            local filepath = node:get_id()
            local bufnr = vim.fn.bufadd(filepath)
            vim.fn.bufload(bufnr)
            local line_end = math.max(vim.api.nvim_buf_line_count(bufnr), 1)
            require("cursorcli").add_selection(1, line_end, bufnr)
          end,
        },
        window = {
          mappings = {
            ["oa"] = "sidekick_add",
            ["oA"] = "cursorcli_add_file",
          },
        },
      },
    },
  },

  -- https://github.com/coder/claudecode.nvim
  {
    "coder/claudecode.nvim",
    enabled = false,
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

  -- https://github.com/folke/sidekick.nvim
  {
    "folke/sidekick.nvim",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end, desc = "Sidekick Toggle Claude" },
      { "<leader>aC", function() require("sidekick.cli").toggle({ name = "codex", focus = true }) end, desc = "Sidekick Toggle Codex" },
    },
  },
}
