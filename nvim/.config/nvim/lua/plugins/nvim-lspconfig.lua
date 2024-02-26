return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              diagnosticMode = "off",
              typeCheckingMode = "off",
              reportUndefinedVariable = "none",
            },
          },
        },
      },
      ruff_lsp = {},
    },
  },
}
