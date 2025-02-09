{ pkgs, ...}:

pkgs.mkShell {
  name = "development";
  buildInputs = [
    pkgs.python312
    pkgs.python312Packages.uv
    pkgs.python312Packages.pip
  ];
  shell = pkgs.zsh;
  shellHook = ''
    exec ${pkgs.zsh}/bin/zsh
  '';
}

