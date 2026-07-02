{
  config,
  pkgs,
  lib,
  home-manager,
  inputs,
  minegrub-world-sel-theme,
  ...
}: {
  imports = [
    ../../hardware-configuration.nix
    ../../modules/system/boot-grub.nix
    ../../modules/system/nvidia.nix
    ../../modules/system/audio.nix
    ../../modules/system/network.nix
    ../../modules/system/locale.nix
    ../../modules/system/users.nix
    ../../modules/system/security.nix
    ../../modules/system/display.nix
    ../../modules/system/packages.nix
    home-manager.nixosModules.home-manager
    minegrub-world-sel-theme.nixosModules.default
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "reverie";

  system.stateVersion = "26.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.fish.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.rokuroo = {
      imports = [
        ../../modules/home/apps.nix
        ../../modules/home/theme.nix
        ../../modules/home/packages.nix
        ../../modules/home/editor.nix
        ../../modules/home/terminal.nix
        ../../modules/home/plasma.nix
      ];

      nixpkgs.config.allowUnfree = true;

      home.stateVersion = "26.05";

      programs.neovim = {
        withRuby = lib.mkForce false;
        withPython3 = lib.mkForce false;
      };
    };
  };
}