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
      hint_position = require("hop.hint").HintPosition.END,
    })
  end,
}
