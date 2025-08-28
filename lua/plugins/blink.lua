-- https://github.com/Saghen/blink.nvim
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
      -- ~/.local/share/nvim/lazy/blink.cmp/lua/blink/cmp/keymap/presets.lua
      preset = "super-tab",
      ["<Tab>"] = {
        "select_next",
        require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
        LazyVim.cmp.map({
          "snippet_forward",
          "ai_accept",
        }),
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
      ["<CR>"] = {
        "select_and_accept",
        "fallback",
      },
      ["<C-y>"] = { "select_and_accept" },
      ["<C-e>"] = { "cancel" },
    },
  },
}
