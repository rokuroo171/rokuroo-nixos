{
  config,
  lib,
  pkgs,
  hyprland,
  ...
}: {
  wayland = {
    windowManager = {
      # compositor
      hyprland = {
        enable = true;
        # mkDefault so per-host dotfile modules (e.g. illogical-impulse,
        # caelestia) can override the package without a definition conflict.
        package = lib.mkDefault hyprland.packages.${pkgs.system}.hyprland;
        xwayland = {
          enable = true;
        };
      };
    };
  };
}
