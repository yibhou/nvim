return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  opts = {
    cmdline = {
      enabled = true,
      sources = function()
        local cmd_type = vim.fn.getcmdtype()
        if cmd_type == ":" then
          return { "cmdline" }
        end
        if cmd_type == "/" or cmd_type == "?" then
          return { "buffer" }
        end
        return {}
      end,
    },
    keymap = {
      -- preset = "super-tab",
    },
  },
}
