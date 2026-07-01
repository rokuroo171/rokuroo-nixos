{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    packages = [
      inputs.zen-browser.packages.${pkgs.system}.default
      pkgs.spotify
      pkgs.spicetify-cli
      pkgs.discord
      pkgs.trash-cli
    ];
  };
}
