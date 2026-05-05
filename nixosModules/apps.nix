{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  config = {
    environment = {
      systemPackages = [
        pkgs.git
        pkgs.wget
        pkgs.vim
        pkgs.hyprland
        pkgs.quickshell
        pkgs.btop
        pkgs.jq
        pkgs.eza
        pkgs.playerctl
        pkgs.wl-clipboard
        pkgs.cliphist
        pkgs.inotify-tools
        pkgs.nmap
        pkgs.iputils
        pkgs.dnsutils
        pkgs.nautilus
      ];
    };
    services = {
      gvfs = {
        enable = true;
      };
      tumbler = {
        enable = true;
      };
    };
  };
}
