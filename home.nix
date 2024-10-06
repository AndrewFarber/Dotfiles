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

    ];
  };

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    prefix = "C-a";
    baseIndex = 1;
    extraConfig = ''
      set-option -g status-position top
      set-option -g status-style bg=default
      set-option -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };

  home.file = {
    ".config/starship.toml".source = ./Starship/starship.toml;
    ".config/nvim/init.lua".source = ./Neovim/init.lua;
    ".config/nvim/lua".source = ./Neovim/lua;
  };

}
