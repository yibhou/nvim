return {
  "hedyhli/outline.nvim",
  cmd = "Outline",
  opts = {},
  config = function(_, opts)
    opts.symbols.filter = nil
    require("outline").setup(opts)
  end,
}
