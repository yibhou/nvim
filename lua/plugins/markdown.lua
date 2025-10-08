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
  },
}
