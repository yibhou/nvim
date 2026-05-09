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
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "dracula",
        callback = function()
          -- :Inspect
          vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#315A46" })
          vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#3E9E5D" })
          vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#4A4263" })
          vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { bg = "#7B65A3" })
        end,
      })
      require("dracula").setup({
        colors = {
          bg = "#282A36",
          fg = "#F8F8F2",
          selection = "#44475A",
          comment = "#6272A4",
          red = "#F87359",
          orange = "#F8B659",
          yellow = "#F1FA8C",
          green = "#66F859",
          purple = "#BD93F9",
          cyan = "#5CF5DB",
          pink = "#F859A8",
          bright_red = "#FF6E6E",
          bright_green = "#69FF94",
          bright_yellow = "#FFFFA5",
          bright_blue = "#D6ACFF",
          bright_magenta = "#FF92DF",
          bright_cyan = "#A4FFFF",
          bright_white = "#FFFFFF",
          menu = "#21222C",
          visual = "#3E4452",
          gutter_fg = "#4B5263",
          nontext = "#3B4048",
          white = "#ABB2BF",
          black = "#191A21",
        },
        overrides = function(colors)
          return {
            MiniDiffSignAdd = { fg = colors.green },
            MiniDiffSignChange = { fg = colors.cyan },
            MiniDiffSignDelete = { fg = colors.red },
            MiniDiffOverAdd = { bg = "#1A3328" },
            MiniDiffOverChange = { fg = colors.red, bg = "#3D1A1A" },
            MiniDiffOverChangeBuf = { fg = colors.green, bg = "#1A3328" },
            MiniDiffOverContext = { fg = colors.fg, bg = "#3D1A1A" },
            MiniDiffOverContextBuf = { bg = "#1A3328" },
            MiniDiffOverDelete = { bg = "#3D1A1A" },
            ComplHint = { fg = colors.comment },
          }
        end,
      })
      vim.cmd.colorscheme("dracula")
    end,
  },
}
