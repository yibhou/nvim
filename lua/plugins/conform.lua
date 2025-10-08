-- https://github.com/stevearc/conform.nvim
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
    },
    formatters = {
      -- https://github.com/stevearc/conform.nvim/blob/master/doc/formatter_options.md#prettier
      prettier = {
        options = {
          ext_parsers = {
            mdc = "markdown",
          },
        },
      },
    },
  },
}
