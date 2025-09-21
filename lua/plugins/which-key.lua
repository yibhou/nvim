-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  opts = {
    filter = function(mapping)
      if mapping.lhs == "gO" then
        return false
      end
      return true
    end,
    spec = {
      { "gk", group = "keys", icon = { icon = "", color = "cyan" } },
      {
        "gkl",
        "<cmd>ComfyLineNumbers enable<cr>",
        desc = "Enable Comfy Line Numbers",
        icon = { icon = " ", color = "yellow" },
      },
      {
        "gkL",
        "<cmd>ComfyLineNumbers disable<cr>",
        desc = "Disable Comfy Line Numbers",
        icon = { icon = " ", color = "green" },
      },
      { "gke", "<cmd>Neotree focus<cr>", desc = "Neotree Focus" },
      { "gkr", "<cmd>Neotree reveal<cr>", desc = "Neotree Reveal" },

      { "gs", group = "search/replace", icon = { icon = "", color = "cyan" } },
      { "gsf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer", mode = { "n", "v" } },
      { "gsg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)", mode = { "n", "v" } },
      { "gsp", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)", mode = { "n", "v" } },
      -- stylua: ignore
      { "gss", function() require("flash").jump() end, desc = "Flash", mode = { "n", "v" } },
      { "gsr", "<cmd>GrugFar<cr>", desc = "Search and Replace", mode = { "n", "v" } },

      { "<leader>a", nil, desc = "AI/Claude Code" },
      {
        "<leader>b",
        function()
          local success, charstr = pcall(vim.fn.getcharstr)
          if not success or not charstr then
            return
          end
          if charstr:match("%d") and charstr ~= "0" then
            return "<cmd>BufferLineGoToBuffer" .. charstr .. "<cr>"
          end
        end,
        desc = "buffer",
        expr = true,
        silent = true,
        noremap = false,
        mode = { "n", "v" },
      },
      { "<leader>bs", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer", mode = { "n", "v" } },
    },
  },
}
