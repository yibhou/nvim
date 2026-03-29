return {
  -- https://github.com/mfussenegger/nvim-jdtls
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local java_home = vim.env.NVIM_JAVA_HOME
      if java_home and java_home ~= "" then
        java_home = vim.fn.expand(java_home)
      else
        java_home = vim.fn.expand("$HOME/.sdkman/candidates/java/21.0.10-amzn")
      end

      local cmd = vim.deepcopy(opts.cmd or {})
      if not cmd[1] then
        cmd = { vim.fn.exepath("jdtls") }
      end
      if cmd[1] ~= "" then
        table.insert(cmd, 2, "--java-executable")
        table.insert(cmd, 3, vim.fs.joinpath(java_home, "bin", "java"))
      end
      opts.cmd = cmd

      opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
        java = {
          configuration = {
            runtimes = {
              { name = "21.0.10-amzn", path = java_home, default = true },
              { name = "17.0.7-amzn", path = vim.fn.expand("$HOME/.sdkman/candidates/java/17.0.7-amzn") },
              { name = "8.0.372-amzn", path = vim.fn.expand("$HOME/.sdkman/candidates/java/8.0.372-amzn") },
            },
          },
        },
      })

      return opts
    end,
  },
}
