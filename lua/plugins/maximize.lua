return {
  -- https://github.com/declancm/maximize.nvim
  {
    "declancm/maximize.nvim",
    event = "VeryLazy",
    config = true,
    keys = {
      { "<C-w>m", "<Cmd>Maximize<CR>", desc = "Maximize" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      local function maximize_status()
        return vim.t.maximized and " " or ""
      end

      table.insert(opts.sections.lualine_x, 2, { maximize_status, color = { fg = "#bd93f9" } })
    end,
  },
}
