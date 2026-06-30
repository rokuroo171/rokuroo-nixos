{
  config,
  pkgs,
  ...
}: {
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;
        xwayland = {
          enable = true;
        };
	settings = {
	  monitor = [ ",preferred,auto,1" ];
	  exec-once = [
	    "caelestia shell -d"
	  ];
	  env = [
	    "NIXOS_OZONE_WL,1"
	  ];
	  misc = {
	    disable_hyprland_logo = true;
	    force_default_wallpaper = 0;
	  };
	};
      };
    };
  };
}
