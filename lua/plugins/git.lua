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
      require("git-conflict").setup(opts)
    end,
  },
}
