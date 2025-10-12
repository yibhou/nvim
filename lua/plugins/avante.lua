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

  { "coder/claudecode.nvim", enabled = false },

  { "CopilotC-Nvim/CopilotChat.nvim", enabled = false },

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
        },
        window = {
          mappings = {
            ["oa"] = "avante_add_files",
          },
        },
      },
    },
  },
}
