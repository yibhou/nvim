-- https://github.com/folke/snacks.nvim
return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = false,
    },
    picker = {
      enabled = true,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
  },
}
