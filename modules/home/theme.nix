{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      # icons
      pkgs.papirus-icon-theme
    ];
  };
}
