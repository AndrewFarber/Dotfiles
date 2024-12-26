{ username, pkgs, ... }:

{

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

    # Other
    xclip

  ];

  home.file = {
    ".config/starship.toml".source = ../Dotfiles/Starship/starship.toml;
    ".config/nvim/init.lua".source = ../Dotfiles/Neovim/init.lua;
    ".config/nvim/lua".source = ../Dotfiles/Neovim/lua;
  };

}
