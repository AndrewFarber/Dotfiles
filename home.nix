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

      hms = "home-manager switch --flake " + Dotfiles;
      hmg = "home-manager generations";
      hmr = "home-manager rollback";
      hme = "home-manager expire-generations";

      ncg = "nix-collect-garbage";

      ll = "eza --header --long --icons";
      lt = "eza --tree --icons";

      lg = "lazygit";
      ld = "lazydocker";

      tn = "tmux new-session";
      tk = "tmux kill-session";
      tl = "tmux list-sessions";
      ta = "tmux attach-session";

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
      nvim-web-devicons
      plenary-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-vsnip
      vim-vsnip

      # Core
      oil-nvim
      tokyonight-nvim
      lualine-nvim
      nvim-treesitter.withAllGrammars
      telescope-nvim
      gitsigns-nvim
      harpoon2
      nvim-autopairs
      comment-nvim
      nvim-cmp
      nvim-lspconfig
      vim-sleuth

    ];
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "frappe"
          set -ogq @catppuccin_window_status_style "slanted"
        '';
      }
    ];
    extraConfig = ''
      set -g prefix C-s
      bind C-s send-prefix
      set-option -g status-position top
      set -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };

  home.file = {
    ".config/starship.toml".source = ./Starship/starship.toml;
    ".config/nvim/init.lua".source = ./Neovim/init.lua;
    ".config/nvim/lua".source = ./Neovim/lua;
  };

}
