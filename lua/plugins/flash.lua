-- https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  opts = {
    label = {
      uppercase = false,
      rainbow = {
        enabled = true,
      },
    },
    modes = {
      search = {
        enabled = false,
      },
      char = {
        jump_labels = true,
      },
      treesitter = {
        jump = {
          autojump = false,
        },
        highlight = {
          backdrop = true,
        },
      },
    },
  },
  -- stylua: ignore
  config = function(_, opts)
    require("flash").setup(opts)

    vim.keymap.set({ "n", "o", "x" }, "s", function() require("flash").jump() end)
    vim.keymap.set({ "n", "o", "x" }, "ss", function() require("flash").jump() end, { desc = "Flash" })
    vim.keymap.set({ "n", "o", "x" }, "sr", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
    vim.keymap.set({ "n", "o", "x" }, "sw", function() require("flash").jump({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Flash Word" })
    vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Flash Toggle" })
    vim.keymap.set({ "n", "o", "x" }, "sL", function()
      require("flash").jump({
        search = { mode = "search", max_length = 0 },
        label = { after = { 0, 0 } },
        pattern = "^",
      })
    end, { desc = "Flash Line" })
  end,
  keys = false,
}
