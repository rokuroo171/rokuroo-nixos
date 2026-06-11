{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      pkgs.papirus-icon-theme
    ];
  };
}
