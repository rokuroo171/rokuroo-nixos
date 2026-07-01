{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    packages = [
      inputs.zen-browser.packages.${pkgs.system}.default
      inputs.claude-cowork-nix.packages.${pkgs.system}.default
      pkgs.obsidian
      pkgs.notion-app-enhanced
      pkgs.appimage-run
      pkgs.spotify
      pkgs.spicetify-cli
      pkgs.discord
      pkgs.trash-cli
    ];
  };
}
