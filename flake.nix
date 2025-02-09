{
  description = "AndrewOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      username = "afarber";
      name = "Andrew Farber";
      email = "Andrew.Farber@outlook.com";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        # config.cudaSupport = true;
      };
    in {

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          (import ./Home-Manager/git.nix { name = name; email = email; })
          (import ./Home-Manager/home.nix { username = username; pkgs = pkgs;})
          ./Home-Manager/neovim.nix
          ./Home-Manager/tmux.nix
          ./Home-Manager/zsh.nix
        ];
      };

      development-shell = import ./Nix-Shells/development.nix { inherit pkgs; };
      python-shell = import ./Nix-Shells/python.nix { inherit pkgs; };
      ai-shell = import ./Nix-Shells/ai.nix { inherit pkgs; };
    };
}

