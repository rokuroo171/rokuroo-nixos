{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.silentSDDM.nixosModules.default
  ];

  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
	settings = {
	  General = {
	    CursorTheme = "Adwaita";
	    EnableHiDPI = false;
	  };
	};
      };
    };
    desktopManager.plasma6.enable = true;
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };
}
