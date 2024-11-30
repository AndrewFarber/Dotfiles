{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {

  name = "python-environment";

  buildInputs = [
    pkgs.python312
    pkgs.python312Packages.pip
    pkgs.python312Packages.virtualenv
    pkgs.python312Packages.mypy
    pkgs.python312Packages.uv
  ];

  shell = pkgs.zsh;

  shellHook = ''
    exec ${pkgs.zsh}/bin/zsh
  '';
}
