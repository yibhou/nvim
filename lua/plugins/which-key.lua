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
      { "gs", group = "keys", icon = "" },

      { "gss", group = "search/replace", icon = "" },
      { "gssf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer", mode = { "n", "v" } },
      { "gssg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)", mode = { "n", "v" } },
      { "gssp", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)", mode = { "n", "v" } },
      { "gssr", "<cmd>GrugFar<cr>", desc = "Search and Replace", mode = { "n", "v" } },
    },
  },
}
