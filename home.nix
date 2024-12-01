{ config, pkgs, ... }:

let
  username = "andrew";
  Dotfiles = "${config.home.homeDirectory}/Dotfiles";
in {

  home.stateVersion = "24.05";
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [

    # Command Line Tools
    eza                       # Replacement for ls
    fzf                       # Fuzzy finder
    gh                        # GitHub CLI tool
    git-credential-manager    # Git credential manager
    lazydocker                # Simple terminal UI for docker
    lazygit                   # Simple terminal UI for git
    ripgrep                   # Faster grep
    starship                  # Customizable prompt
    tldr                      # Community-maintained help pages

    # Language Server Protocols (LSPs)
    lua-language-server       # Lua
    nil                       # Nix
    pyright                   # Python

  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      hme = "home-manager expire-generations";
      hmg = "home-manager generations";
      hmr = "home-manager rollback";
      hms = "home-manager switch --flake " + Dotfiles;
      ld = "lazydocker";
      lg = "lazygit";
      ll = "eza --header --long --icons";
      lt = "eza --tree --icons";
      ncg = "nix-collect-garbage";
      python-shell-empty = "nix develop " + Dotfiles + "#python-shell-empty";
      python-shell = "nix develop " + Dotfiles + "#python-shell";
    };
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.git = {
    enable = true;
    userName = "Andrew Farber";
    userEmail = "Andrew.Farber@outlook.com";
    extraConfig = {
      credential.helper = "store";
    };
  };

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

  home.file = {
    ".config/starship.toml".source = ./Starship/starship.toml;
    ".config/nvim/init.lua".source = ./Neovim/init.lua;
    ".config/nvim/lua".source = ./Neovim/lua;
  };

}
