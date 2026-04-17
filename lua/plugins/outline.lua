-- https://github.com/hedyhli/outline.nvim
return {
  "hedyhli/outline.nvim",
  cmd = "Outline",
  opts = {
    outline_window = {
      auto_jump = false,
      show_numbers = true,
      show_relative_numbers = true,
    },
    preview_window = {
      auto_preview = false,
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
