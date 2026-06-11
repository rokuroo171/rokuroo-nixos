{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      pkgs.spotify
      pkgs.spicetify-cli
      pkgs.discord
      pkgs.trash-cli
    ];
  };
}
