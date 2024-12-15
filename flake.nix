{
  description = "Dotfiles managed with Nix flakes and Home-Manager";

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
        modules = [ ./home.nix ];
      };

      python-shell-empty = pkgs.mkShell {
        name = "python";
        buildInputs = [
          pkgs.python312
          pkgs.python312Packages.uv
          pkgs.python312Packages.pip
        ];
        shell = pkgs.zsh;
        shellHook = ''
          exec ${pkgs.zsh}/bin/zsh
        '';
      };

      python-shell = pkgs.mkShell {
        name = "python";
        buildInputs = [
          pkgs.python312

          pkgs.python312Packages.alembic
          pkgs.python312Packages.cvxpy
          pkgs.python312Packages.fastapi
          pkgs.python312Packages.httpx
          pkgs.python312Packages.jinja2
          pkgs.python312Packages.matplotlib
          pkgs.python312Packages.mypy
          pkgs.python312Packages.numpy
          pkgs.python312Packages.pandas
          pkgs.python312Packages.pip
          pkgs.python312Packages.psycopg
          pkgs.python312Packages.pydantic
          pkgs.python312Packages.pydantic-settings
          pkgs.python312Packages.pyodbc
          pkgs.python312Packages.pytest
          pkgs.python312Packages.python-multipart
          pkgs.python312Packages.requests
          pkgs.python312Packages.ruff
          pkgs.python312Packages.scikit-learn
          pkgs.python312Packages.scipy
          pkgs.python312Packages.sqlalchemy
          pkgs.python312Packages.statsmodels
          pkgs.python312Packages.uv
          pkgs.python312Packages.uvicorn

        ];
        shell = pkgs.zsh;
        shellHook = ''
          exec ${pkgs.zsh}/bin/zsh
        '';
      };

    };
}

