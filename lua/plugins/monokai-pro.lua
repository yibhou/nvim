-- https://github.com/loctvl842/monokai-pro.nvim
return {
  "loctvl842/monokai-pro.nvim",
  opts = {
    -- classic | octagon | pro | machine | ristretto | spectrum
    filter = "pro",
  },
  config = function(_, opts)
    require("monokai-pro").setup(opts)
    vim.cmd([[colorscheme monokai-pro]])
  end,
}
