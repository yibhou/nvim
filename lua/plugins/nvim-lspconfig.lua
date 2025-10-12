-- https://github.com/neovim/nvim-lspconfig
return {
  "neovim/nvim-lspconfig",
  opts = {
    -- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.Opts
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 1,
        prefix = "",
      },
      signs = {
        priority = 1,
        numhl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticVirtualTextError",
          [vim.diagnostic.severity.WARN] = "DiagnosticVirtualTextWarn",
          [vim.diagnostic.severity.HINT] = "DiagnosticVirtualTextHint",
          [vim.diagnostic.severity.INFO] = "DiagnosticVirtualTextInfo",
        },
      },
    },
    servers = {
      cssls = {},
      marksman = {},
    },
  },
}
