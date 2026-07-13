return {
  -- https://github.com/yibhou/nvim-get-ref
  {
    "yibhou/nvim-get-ref",
    event = "VeryLazy",
    config = function()
      require("nvim-get-ref").setup({
        path_style = "cwd",
        keymaps = {
          visual = "<leader>ay",
          normal = "<leader>ay",
        },
      })
    end,
  },
  -- https://github.com/chentoast/marks.nvim
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- https://github.com/3rd/image.nvim
  {
    "3rd/image.nvim",
    enabled = function()
      return vim.fn.executable("magick") == 1 and not vim.g.neovide
    end,
    build = false,
    event = "VeryLazy",
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = {
          clear_in_insert_mode = true,
          download_remote_images = true,
          only_render_image_at_cursor = true,
        },
      },
    },
  },
  -- https://github.com/hakonharnes/img-clip.nvim
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    ft = { "markdown" },
    opts = {
      default = {
        verbose = false,
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
    },
  },
  -- :help telescope.defaults
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        history = {
          limit = 100,
        },
        mappings = {
          i = {
            ["<Up>"] = require("telescope.actions").cycle_history_prev,
            ["<Down>"] = require("telescope.actions").cycle_history_next,
            ["<C-h>"] = require("telescope.actions").results_scrolling_left,
            ["<C-l>"] = require("telescope.actions").results_scrolling_right,

            ["<C-d>"] = false,
            ["<C-f>"] = false,
            ["<C-k>"] = false,
            ["<C-u>"] = false,
            ["<M-f>"] = false,
          },
          n = {
            ["<C-h>"] = require("telescope.actions").results_scrolling_left,
            ["<C-l>"] = require("telescope.actions").results_scrolling_right,
            ["<C-n>"] = require("telescope.actions").move_selection_next,
            ["<C-p>"] = require("telescope.actions").move_selection_previous,

            ["<M-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<M-j>"] = require("telescope.actions").preview_scrolling_down,
            ["<M-k>"] = require("telescope.actions").preview_scrolling_up,
            ["<M-l>"] = require("telescope.actions").preview_scrolling_right,

            ["<C-d>"] = false,
            ["<C-f>"] = false,
            ["<C-k>"] = false,
            ["<C-u>"] = false,
            ["<M-f>"] = false,
          },
        },
      },
    },
  },
  -- https://github.com/karb94/neoscroll.nvim
  {
    "karb94/neoscroll.nvim",
    opts = {
      performance_mode = false,
    },
  },
}
