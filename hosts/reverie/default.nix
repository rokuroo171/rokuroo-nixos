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

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors.hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland via UWSM";
      binPath = "/run/current-system/sw/bin/Hyprland";
    };
  };

  programs.fish.enable = true;

  environment.systemPackages = [ pkgs.xdg-desktop-portal-hyprland ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.rokuroo = {
      imports = [
        ../../modules/home/apps.nix
        ../../modules/home/theme.nix
        ../../modules/home/packages.nix
        ../../modules/home/editor.nix
        ../../modules/home/terminal.nix
        ../../modules/home/hyprland.nix
        ../../modules/home/caelestia.nix
      ];

      nixpkgs.config.allowUnfree = true;

      home.stateVersion = "26.05";

      programs.neovim = {
        withRuby = lib.mkForce false;
        withPython3 = lib.mkForce false;
      };

      wayland.windowManager.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
}