{
  config,
  pkgs,
  hyprland,
  ...
}: {
  wayland = {
    windowManager = {
      # compositor
      hyprland = {
        enable = true;
        package = hyprland.packages.${pkgs.system}.hyprland;
        xwayland = {
          enable = true;
        };
      };
    };
  };
}
