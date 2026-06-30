{
  config,
  pkgs,
  hyprland,
  ...
}: {
  imports = [
    ../../modules/home/apps.nix
    ../../modules/home/theme.nix
    ../../modules/home/packages.nix
    ../../modules/home/editor.nix
    ../../modules/home/terminal.nix
    ../../modules/home/hyprland.nix
    ../../modules/home/caelestia.nix
  ];

  home = {
    stateVersion = "26.05";
  };

  wayland.windowManager.hyprland.package = hyprland.packages.${pkgs.system}.hyprland;
}
