{
  config,
  pkgs,
  silentSDDM,
  ...
}: {
  imports = [
    silentSDDM.nixosModules.default
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
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };
}
