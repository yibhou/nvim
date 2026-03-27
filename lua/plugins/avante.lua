return {
  -- https://github.com/yetone/avante.nvim
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- The below dependencies are optional
      "nvim-telescope/telescope.nvim",
      "saghen/blink.cmp",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      -- for provider copilot
      "zbirenbaum/copilot.lua",
      -- support for image pasting
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        ft = { "markdown", "Avante" },
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
    },
    opts = {
      provider = "claude",
      -- auto_suggestions_provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.moonshot.cn/anthropic",
          model = "kimi-k2-0905-preview",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
      behaviour = {
        -- auto_suggestions = true,
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
      sources = {
        default = { "avante", "lsp", "path", "snippets", "buffer" },
        providers = {
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {},
          },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        commands = {
          avante_add_files = function(state)
            local node = state.tree:get_node()
            local filepath = node:get_id()
            local relative_path = require("avante.utils").relative_path(filepath)

            local sidebar = require("avante").get()

            local open = sidebar:is_open()
            -- ensure avante sidebar is open
            if not open then
              require("avante.api").ask()
              sidebar = require("avante").get()
            end

            sidebar.file_selector:add_selected_file(relative_path)

            -- remove neo tree buffer
            if not open then
              sidebar.file_selector:remove_selected_file("neo-tree filesystem [1]")
            end
          end,
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
            ["oa"] = "avante_add_files",
            ["oA"] = "cursorcli_add_file",
          },
        },
      },
    },
  },

  -- https://github.com/zbirenbaum/copilot.lua
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = vim.fn.expand("$HOME/.nvm/versions/node/v22.22.0/bin/node"),
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
