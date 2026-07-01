{
  config,
  pkgs,
  inputs,
  ...
}: {
  home = {
    packages = [
      inputs.zen-browser.packages.${pkgs.system}.default
      inputs.claude-desktop.packages.${pkgs.system}.claude-desktop-with-fhs
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
