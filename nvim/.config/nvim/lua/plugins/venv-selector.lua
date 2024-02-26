return {
  "linux-cultist/venv-selector.nvim",
  cmd = "VenvSelect",
  opts = function(_, opts)
    if require("lazyvim.util").has("nvim-dap-python") then
      opts.dap_enabled = true
    end
    return vim.tbl_deep_extend("force", opts, {
      name = ".venv",
      parents = 0,
    })
  end,
  keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
}
