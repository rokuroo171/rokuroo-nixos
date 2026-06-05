{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../hardware-configuration.nix
    ../../modules/system/boot.nix
    ../../modules/system/amd.nix
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

  networking.hostName = "opal";

  home-manager.users.rokuroo = {
    # caelestia dots config
    programs.caelestia-dots = {
      enable = true;
      hypr.enable = true;
      editor.enable = true;
      term.enable = true;
      btop.enable = true;
      foot.enable = true;
    };
  };
}
