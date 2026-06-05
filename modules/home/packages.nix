{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      # system info
      pkgs.fastfetch
      # terminal toys
      pkgs.asciiquarium
      pkgs.cmatrix
      pkgs.cava
      pkgs.lavat
      # dev tools
      pkgs.clang
      pkgs.gnumake
    ];
  };
}
