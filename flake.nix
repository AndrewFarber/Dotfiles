{
  description = "Dotfiles managed with Nix flakes and Home-Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      username = "andrew";
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [ ./home.nix ];
      };

      python-shell = pkgs.mkShell {
        name = "python";
        buildInputs = [
          pkgs.python312
          pkgs.python312Packages.pip
          pkgs.python312Packages.mypy
          pkgs.python312Packages.uv
          pkgs.python312Packages.ruff
        ];
        shell = pkgs.zsh;
        shellHook = ''
          exec ${pkgs.zsh}/bin/zsh
        '';
      };

    };
}

