{
  config,
  pkgs,
  lib,
  home-manager,
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
    home-manager.nixosModules.home-manager
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "reverie";

  system.stateVersion = "26.05";

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