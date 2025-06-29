-- https://github.com/nvimdev/lspsaga.nvim
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    symbol_in_winbar = {
      enable = false,
    },
    lightbulb = {
      enable = false,
    },
  },
  keys = {
    { "gH", "<Cmd>Lspsaga finder<CR>", desc = "Lspsaga Finder" },
    { "gh", "<Cmd>Lspsaga hover_doc<CR>", desc = "Lspsaga Hover" },
    { "gko", "<Cmd>Lspsaga outline<CR>", desc = "Lspsaga Outline" },
    { "gkR", "<Cmd>Lspsaga rename<CR>", desc = "Lspsaga Rename Symbol" },
  },
}
