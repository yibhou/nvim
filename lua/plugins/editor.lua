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
  -- https://github.com/jake-stewart/multicursor.nvim
  {
    "jake-stewart/multicursor.nvim",
    event = "VeryLazy",
    -- stylua: ignore
    config = function()
      local multicursor = require("multicursor-nvim")
      multicursor.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor
      set({ "n", "x" }, "<M-Up>", function() multicursor.lineAddCursor(-1) end)
      set({ "n", "x" }, "<M-Down>", function() multicursor.lineAddCursor(1) end)
      set({ "n", "x" }, "<MS-Up>", function() multicursor.lineSkipCursor(-1) end)
      set({ "n", "x" }, "<MS-Down>", function() multicursor.lineSkipCursor(1) end)

      -- Add or skip adding a new cursor by matching word/selection
      set({ "n", "x" }, "gbn", function() multicursor.matchAddCursor(1) end, { desc = "Match Add Cursor" })
      set({ "n", "x" }, "gbp", function() multicursor.matchAddCursor(-1) end, { desc = "Match Add Cursor" })
      set({ "n", "x" }, "gbN", function() multicursor.matchSkipCursor(1) end, { desc = "Match Skip Cursor" })
      set({ "n", "x" }, "gbP", function() multicursor.matchSkipCursor(-1) end, { desc = "Match Skip Cursor" })

      -- Add and remove cursors with option + left click
      set("n", "<M-leftmouse>", multicursor.handleMouse)
      set("n", "<M-leftdrag>", multicursor.handleMouseDrag)
      set("n", "<M-leftrelease>", multicursor.handleMouseRelease)

      -- Disable and enable cursors
      set({ "n", "x" }, "gbt", multicursor.toggleCursor, { desc = "Toggle Cursor" })

      -- Mappings defined in a keymap layer only apply when there are multiple cursors
      -- This lets you have overlapping mappings
      multicursor.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one
        layerSet({ "n", "x" }, "<Left>", multicursor.prevCursor)
        layerSet({ "n", "x" }, "<Right>", multicursor.nextCursor)

        -- Delete the main cursor
        layerSet({ "n", "x" }, "gbd", multicursor.deleteCursor, { desc = "Delete Cursor" })

        -- Enable and clear cursors using escape
        layerSet("n", "<Esc>", function()
          if not multicursor.cursorsEnabled() then
            multicursor.enableCursors()
          else
            multicursor.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

      -- Pressing `gbaip` will add a cursor on each line of a paragraph
      -- Can also be used to add cursor for each line of visual selection
      set({ "n", "x" }, "gba", multicursor.addCursorOperator, { desc = "Add Cursor Operator" })

      -- Clone every cursor and disable the originals
      set({ "n", "x" }, "gby", multicursor.duplicateCursors, { desc = "Duplicate Cursors" })

      -- Align cursor columns
      set("n", "gb<Tab>", multicursor.alignCursors, { desc = "Align Cursors" })

      -- Split visual selections by regex
      set("x", "gb|", multicursor.splitCursors, { desc = "Split Cursors" })

      -- match new cursors within visual selections by regex
      set("x", "gbf", multicursor.matchCursors, { desc = "Match Cursors" })

      -- bring back cursors if you accidentally clear them
      set("n", "gbR", multicursor.restoreCursors, { desc = "Restore Cursors" })

      -- Add a cursor for all matches of cursor word/selection in the document
      set({ "n", "x" }, "gbM", multicursor.matchAllAddCursors, { desc = "Match All Add Cursors" })

      -- Append/insert for each line of visual selections
      -- Similar to block selection insertion
      set("x", "I", multicursor.insertVisual)
      set("x", "A", multicursor.appendVisual)

      -- Increment/decrement sequences, treating all cursors as one sequence
      set({ "n", "x" }, "gbu", multicursor.sequenceIncrement, { desc = "Sequence Increment" })
      set({ "n", "x" }, "gbU", multicursor.sequenceDecrement, { desc = "Sequence Decrement" })

      -- Add a cursor and jump to the next/previous search result
      set("n", "gbsn", function() multicursor.searchAddCursor(1) end, { desc = "Search Add Cursor" })
      set("n", "gbsp", function() multicursor.searchAddCursor(-1) end, { desc = "Search Add Cursor" })

      -- Jump to the next/previous search result without adding a cursor
      set("n", "gbsN", function() multicursor.searchSkipCursor(1) end, { desc = "Search Skip Cursor" })
      set("n", "gbsP", function() multicursor.searchSkipCursor(-1) end, { desc = "Search Skip Cursor" })

      -- Add a cursor to every search result in the buffer
      set("n", "gbsa", multicursor.searchAllAddCursors, { desc = "Search All Add Cursors" })

      -- Pressing `gbmiwap` will create a cursor in every match of the
      -- string captured by `iw` inside range `ap`
      -- This action is highly customizable, see `:h multicursor-operator`
      set({ "n", "x" }, "gbm", multicursor.operator, { desc = "Match Range Add Cursors" })
    end,
  },
}
