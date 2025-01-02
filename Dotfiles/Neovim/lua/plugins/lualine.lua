-- GitHub Repository: https://github.com/nvim-lualine/lualine.nvim
-- Description: Configurable Neovim statusline
require('lualine').setup({
  sections = {
    lualine_c = {
      {
        "navic",
        color_correction = "dynamic", -- nil, "static" or "dynamic"
        navic_opts = nil,
      }
    }
  },
})

