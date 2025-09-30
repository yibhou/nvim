return {
  -- https://github.com/f-person/git-blame.nvim
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      message_when_not_committed = "",
    },
  },

  -- https://github.com/akinsho/git-conflict.nvim
  {
    "akinsho/git-conflict.nvim",
    opts = {
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#1d5800" })
      require("git-conflict").setup(opts)
    end,
  },
}
