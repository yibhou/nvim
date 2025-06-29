return {
  -- disable snacks indent when indent-blankline is enabled
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false },
    },
  },
  {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
      -- https://github.com/HiPhish/rainbow-delimiters.nvim
      "hiphish/rainbow-delimiters.nvim",
    },
    event = "LazyFile",
    opts = function()
      return {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = {
          show_start = false,
          show_end = false,
          include = {
            -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/ibl/scope_languages.lua
            node_type = {
              ["*"] = {
                "object",
                "array",
                "class_declaration",
              },
            },
          },
        },
        exclude = {
          filetypes = {
            "Trouble",
            "alpha",
            "dashboard",
            "help",
            "lazy",
            "mason",
            "neo-tree",
            "notify",
            "snacks_dashboard",
            "snacks_notif",
            "snacks_terminal",
            "snacks_win",
            "toggleterm",
            "trouble",
          },
        },
      }
    end,
    config = function(_, opts)
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }
      local hooks = require("ibl.hooks")

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)
      vim.g.rainbow_delimiters = { highlight = highlight }
      opts.scope.highlight = highlight
      -- opts.indent.highlight = highlight

      require("ibl").setup(opts)

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
