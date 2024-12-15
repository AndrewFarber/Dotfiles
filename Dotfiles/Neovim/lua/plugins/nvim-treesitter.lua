-- GitHub Repository: https://github.com/nvim-treesitter/nvim-treesitter
-- Description: Syntax tree parser
require('nvim-treesitter.configs').setup({
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
