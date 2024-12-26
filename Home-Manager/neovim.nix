{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [

      # Dependencies
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp-vsnip
      nui-nvim
      nvim-notify
      nvim-web-devicons
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      vim-vsnip

      # Core
      comment-nvim
      gitsigns-nvim
      harpoon2
      lualine-nvim
      noice-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      oil-nvim
      telescope-nvim
      tokyonight-nvim
      vim-sleuth
      which-key-nvim

    ];
  };
}
