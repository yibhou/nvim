-- https://github.com/jellydn/hurl.nvim
return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "hurl",
  opts = {
    auto_close = false,
  },
  keys = {
    { "gkh", "<Cmd>HurlRunnerAt<CR>", desc = "Hurl Runner" },
  },
}
