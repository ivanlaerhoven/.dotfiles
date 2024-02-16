return {
  -- add dracula
  {
    "Mofiqul/dracula.nvim",
    opts = {
      transparent_bg = "transparent",
    },
  },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
