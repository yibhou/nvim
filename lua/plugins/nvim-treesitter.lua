-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "cpp",
      "go",
      "hurl",
      "java",
      "rust",
      "scss",
      "vue",
    },
  },
}
