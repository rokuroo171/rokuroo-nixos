{
  config,
  pkgs,
  ...
}: {
  wayland = {
    windowManager = {
      # compositor
      hyprland = {
        enable = true;
        xwayland = {
          enable = true;
        };
      };
    };
  };
}
