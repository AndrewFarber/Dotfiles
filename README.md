# Dotfiles

Andrew's development environment:

- OS: Windows using WSL 2
- Terminal Emulator: Alacritty
- Terminal Multiplexer: tmux
- Shell: Zsh
- Prompt: Starship
- Packages: Nix
- Environment: Home-Manager

## Installation

- Install a [Nerd Font](https://www.nerdfonts.com/).
- Install [WSL](https://learn.microsoft.com/en-us/windows/wsl/).
  - `systemd` must be [enabled](https://learn.microsoft.com/en-us/windows/wsl/systemd).
- Install [Alacritty](https://alacritty.org/).
- Install [Nix](https://nixos.org/) within WSL.
  - Add `experimental-features = nix-command flakes` to `/etc/nix/nix.conf` file.
- Install [Home-Manager](https://nix-community.github.io/home-manager/).

# Home-Manager Standalone Installation

```shell
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```
