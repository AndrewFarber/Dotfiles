-- GitHub Repository: https://github.com/nvim-lualine/lualine.nvim
-- Description: Configurable Neovim statusline
require('lualine').setup({
  winbar = {
    lualine_c = {
      {
        "navic",
        color_correction = nil,
        navic_opts = nil
      }
    }
  }
})

