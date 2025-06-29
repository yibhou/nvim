return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    lightbulb = {
      enable = false,
    },
    outline = {
      layout = "float",
    },
  },
  keys = {
    { "gH", "<Cmd>Lspsaga finder<CR>", desc = "Lspsaga Finder" },
    { "gh", "<Cmd>Lspsaga hover_doc<CR>", desc = "Lspsaga Hover" },
    { "gso", "<Cmd>Lspsaga outline<CR>", desc = "Lspsaga Outline" },
    { "gsr", "<Cmd>Lspsaga rename<CR>", desc = "Lspsaga Rename Symbol" },
    { "gsb", "<Cmd>Lspsaga winbar_toggle<CR>", desc = "Lspsaga Breadcrumb" },
  },
}
