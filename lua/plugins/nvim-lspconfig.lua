-- https://github.com/neovim/nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 16,
        prefix = "",
      },
    },
    servers = {
      cssls = {},
    },
  },
}
