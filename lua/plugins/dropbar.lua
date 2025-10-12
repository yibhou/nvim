-- https://github.com/Bekaboo/dropbar.nvim
return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  opts = {
    menu = {
      preview = false,
    },
  },
  config = function(_, opts)
    require("dropbar").setup(opts)

    vim.keymap.set("n", "gkd", require("dropbar.api").pick, { desc = "Dropbar Pick" })
  end,
}
