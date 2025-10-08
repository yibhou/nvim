return {
  -- https://github.com/bullets-vim/bullets.vim
  {
    "bullets-vim/bullets.vim",
    event = "VeryLazy",
    ft = { "markdown" },
  },
  -- https://github.com/MeanderingProgrammer/render-markdown.nvim
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown", "Avante" },
    opts = {
      enabled = true,
      file_types = { "markdown", "Avante" },
      anti_conceal = {
        ignore = {
          bullet = true,
          callout = true,
          code_language = true,
          dash = true,
          head_background = true,
        },
      },
      completions = {
        blink = { enabled = true },
        lsp = { enabled = true },
      },
      heading = {
        position = "inline",
        width = "block",
        left_margin = 0,
        left_pad = 1,
        right_pad = 1,
      },
      code = {
        language_pad = 1,
        left_pad = 1,
        right_pad = 1,
        border = "thin",
        inline_pad = 1,
      },
      bullet = {
        icons = { "●", "▪", "◆" },
      },
      checkbox = {
        unchecked = {
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          highlight = "RenderMarkdownChecked",
          scope_highlight = "RenderMarkdownChecked",
        },
      },
      sign = {
        enabled = false,
      },
      win_options = {
        concealcursor = { rendered = "nvc" },
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#6A4599", fg = "#CBA6F7" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#7D2850", fg = "#FF79C6" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#3D7D4A", fg = "#A6E3A1" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#A05820", fg = "#FAB387" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#3D7575", fg = "#94E2D5" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#4A4A99", fg = "#B4BEFE" })
    end,
  },
}
