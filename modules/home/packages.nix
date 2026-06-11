{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      pkgs.fastfetch
      pkgs.asciiquarium
      pkgs.cmatrix
      pkgs.cava
      pkgs.lavat
      pkgs.clang
      pkgs.gnumake
    ];
  };
}
