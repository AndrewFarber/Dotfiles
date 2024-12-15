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
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [ ./Home-Manager/home.nix ];
      };

      python-shell-empty = import ./Nix-Shells/python-shell-empty.nix { inherit pkgs; };
      python-shell = import ./Nix-Shells/python-shell.nix { inherit pkgs; };
    };
}

