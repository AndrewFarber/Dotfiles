{ config, ... }:
let
  Dotfiles = "${config.home.homeDirectory}/Dotfiles";
in
{
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
      ai-shell = "nix develop " + Dotfiles + "#ai-shell";
      python-shell = "nix develop " + Dotfiles + "#python-shell";
      development-shell = "nix develop " + Dotfiles + "#development-shell";
      ta = "tmux attach-session";
      tk = "tmux kill-session";
      tl = "tmux list-sessions";
      tn = "tmux new-session";
    };
    initExtra = ''
      eval "$(starship init zsh)"
    '';
  };
}
