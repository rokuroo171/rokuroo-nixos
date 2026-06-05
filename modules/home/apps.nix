{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = [
      # music
      pkgs.spotify
      pkgs.spicetify-cli
      # chat
      pkgs.discord
      # trash manager
      pkgs.trash-cli
    ];
  };
}
