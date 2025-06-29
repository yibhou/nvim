-- https://github.com/smoka7/hop.nvim
return {
  "smoka7/hop.nvim",
  event = "VeryLazy",
  vscode = true,
  config = function()
    local hop = require("hop")
    hop.setup({
      keys = "etovxqpdygfblzhckisuran",
      quit_key = "<SPC>",
      jump_on_sole_occurrence = false,
      case_insensitive = false,
      multi_windows = false,
      hint_position = require("hop.hint").HintPosition.BEGIN,
    })
  end,
  keys = {
    {
      "sh",
      "<cmd>lua require('hop').hint_words()<cr>",
      mode = { "n", "x" },
      silent = true,
      remap = true,
      desc = "HopWord",
    },
    { "<leader>s", "<esc><cmd>lua require('hop').hint_words()<cr>", mode = "i", silent = true },
  },
}
