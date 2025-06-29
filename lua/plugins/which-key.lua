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
      { "gkr", "<cmd>Neotree reveal<cr>", desc = "Neotree Reveal" },

      { "gs", group = "search/replace", icon = { icon = "", color = "cyan" } },
      { "gsf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer", mode = { "n", "v" } },
      { "gsg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)", mode = { "n", "v" } },
      { "gsp", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)", mode = { "n", "v" } },
      { "gsr", "<cmd>GrugFar<cr>", desc = "Search and Replace", mode = { "n", "v" } },
    },
  },
}
