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
      # login manager
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
    };
  };

  programs.silentSDDM = {
    enable = true;
    theme = "rei";
  };
}
