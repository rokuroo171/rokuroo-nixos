{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/audio.nix
    ../../modules/system/network.nix
    ../../modules/system/locale.nix
    ../../modules/system/users.nix
    ../../modules/system/security.nix
    ../../modules/system/display.nix
    ../../modules/system/packages.nix
    inputs.home-manager.nixosModules.home-manager
    ../../modules/home
  ];

  networking.hostName = "reverie";

  home-manager.users.rokuroo = let
    hypr = inputs.hyprland.packages.${pkgs.system};
  in {
    # end-4 dots config
    illogical-impulse = {
      enable = true;
      hyprland = {
        monitor = [ ",preferred,auto,1" ];
        package = hypr.hyprland;
        xdgPortalPackage = hypr.xdg-desktop-portal-hyprland;
        ozoneWayland.enable = true;
      };
    };
  };
}
