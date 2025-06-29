-- https://github.com/hedyhli/outline.nvim
return {
  "hedyhli/outline.nvim",
  cmd = "Outline",
  opts = {
    preview_window = {
      auto_preview = true,
    },
  },
  config = function(_, opts)
    opts.symbols.filter = nil
    require("outline").setup(opts)
  end,
  keys = {
    { "gko", "<Cmd>Outline<CR>", desc = "Outline" },
  },
}
