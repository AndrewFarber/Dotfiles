{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    baseIndex = 1;
    prefix = "C-a";
    extraConfig = ''
      set-option -g status-position top
      set-option -g status-style bg=default
    '';
  };
}
