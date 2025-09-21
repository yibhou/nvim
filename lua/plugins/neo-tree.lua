-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "folke/snacks.nvim",
  },
  opts = {
    hide_root_node = true,
    retain_hidden_root_indent = true,
    default_component_configs = {
      file_size = {
        enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
    },
    window = {
      auto_expand_width = false,
      mappings = {
        ["<cr>"] = "open_vsplit",
        ["s"] = "noop",
      },
    },
    filesystem = {
      window = {
        mappings = {
          [","] = "grug_far_replace",
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
        },
      },
      follow_current_file = {
        enabled = false,
      },
    },
  },
  -- overwrite
  config = function(_, opts)
    local function open_grug_far(prefills)
      local grug_far = require("grug-far")

      if not grug_far.has_instance("explorer") then
        grug_far.open({ instanceName = "explorer" })
      else
        grug_far.get_instance("explorer"):open()
      end
      vim.schedule(function()
        -- doing it seperately because multiple paths doesn't open work when passed with open
        -- updating the prefills without clearing the search and other fields
        grug_far.get_instance("explorer"):update_input_values(prefills, false)
      end)
    end

    opts.commands = vim.tbl_extend("keep", opts.commands or {}, {
      grug_far_replace = function(state)
        local node = state.tree:get_node()
        local prefills = {
          -- also escape the paths if space is there
          -- if you want files to be selected, use ':p' only, see filename-modifiers
          paths = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
            or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h")),
        }
        open_grug_far(prefills)
      end,
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/fbb631e818f48591d0c3a590817003d36d0de691/doc/neo-tree.txt#L535
      grug_far_replace_visual = function(state, selected_nodes, callback)
        local paths = {}
        for _, node in pairs(selected_nodes) do
          -- also escape the paths if space is there
          -- if you want files to be selected, use ':p' only, see filename-modifiers
          local path = node.type == "directory" and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
            or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h"))
          table.insert(paths, path)
        end
        local prefills = { paths = table.concat(paths, "\n") }
        open_grug_far(prefills)
      end,
    })

    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end

    local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
}
