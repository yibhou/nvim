return {
  { "catppuccin/nvim", enabled = false },
  { "loctvl842/monokai-pro.nvim", enabled = false },
  { "Mofiqul/vscode.nvim", enabled = false },
  { "navarasu/onedark.nvim", enabled = false },
  { "Mofiqul/dracula.nvim", enabled = true },

  -- https://github.com/loctvl842/monokai-pro.nvim
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    opts = {
      -- classic | octagon | pro | machine | ristretto | spectrum
      filter = "spectrum",
    },
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd([[colorscheme monokai-pro]])
    end,
  },
  -- https://github.com/Mofiqul/vscode.nvim
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        style = "dark",
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
      vim.cmd.colorscheme("vscode")
    end,
  },
  -- https://github.com/navarasu/onedark.nvim
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = "darker",
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()
    end,
  },
  -- https://github.com/Mofiqul/dracula.nvim
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function()
      require("dracula").setup()
      vim.cmd.colorscheme("dracula")
    end,
  },
}
