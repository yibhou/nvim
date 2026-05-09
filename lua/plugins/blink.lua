-- https://github.com/Saghen/blink.nvim
return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  opts = {
    -- https://cmp.saghen.dev/configuration/keymap#keymap
    keymap = {
      -- ~/.local/share/nvim/lazy/blink.cmp/lua/blink/cmp/keymap/presets.lua
      ["<Tab>"] = {
        LazyVim.cmp.map({
          "snippet_forward",
          "ai_nes",
          "ai_accept",
        }),
        "select_next",
        "fallback",
      },
      ["<S-Tab>"] = {
        "snippet_backward",
        "select_prev",
        "fallback",
      },
      ["<CR>"] = {
        "accept",
        "fallback",
      },
      ["<C-y>"] = { "select_and_accept" },
      ["<C-e>"] = { "cancel" },
    },
  },
}
