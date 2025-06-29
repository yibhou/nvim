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
    },
  },
}
